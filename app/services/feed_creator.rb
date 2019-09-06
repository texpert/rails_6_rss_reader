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
    if response.status != 200
      errors.messages[:feed_request] = { response: response.to_s, status: response.status }
      return self
    end

    fetched_feed = Feedjira.parse(response.to_s)

    @feed = Feed.new(@params)
    @feed.title = fetched_feed.title

    @feed.save!(validate: false) if @feed.valid?
    @feed
  rescue StandardError => e
    errors.messages[:exception] = e
    self
  end

  private

  def params_valid?
    @url = @params[:url]
    return true if Twingly::URL.parse(@url).valid?

    errors.messages[:url] = "#{@url} isn't valid"
    false
  end
end
