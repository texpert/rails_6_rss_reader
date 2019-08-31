# frozen_string_literal: true

class FeedCreator
  def self.run(params)
    new(params).run
  end

  Errors = Struct.new(:messages)

  def initialize(params)
    @params = params
    @errors = Errors.new({})
  end

  attr_reader :errors

  def run
    return self unless params_valid?

    response = HTTPX.get(@url)
    (errors.messages[:feed_request] = response.to_s) && (return self) if response.status > 205

    feed = Feedjira.parse(response.to_s)

    @feed = Feed.new(@params)
    @feed.title = feed.title

    @feed.save
    @feed
  end

  private

  def params_valid?
    @url = @params[:url]
    return true if Twingly::URL.parse(@url).valid?

    errors.messages[:url] = "#{@url} isn't valid"
  end
end
