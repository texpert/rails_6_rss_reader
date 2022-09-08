# frozen_string_literal: true

class PostsAggregator
  def self.run(...)
    new(...).run
  end

  Errors = Struct.new(:messages)

  def initialize(params)
    @params = params
    @errors = Errors.new({})
  end

  attr_reader :errors

  def run
    feed_id = @params[:feed_id]
    feeds_urls = feed_id ? Feed.where(id: feed_id).pluck(:url) : Feed.pluck(:url)

    responses = *HTTPX.plugin(:follow_redirects).max_redirects(42).get(*feeds_urls)

    posts = []
    responses.each do |r|
      next if r.status != 200

      fetched_feed = Feedjira.parse(r.to_s)
      fetched_feed.entries.each { |e| posts << e }
    end

    posts.sort_by(&:published).reverse
  rescue StandardError => e
    errors.messages[:exception] = e
    self
  end
end
