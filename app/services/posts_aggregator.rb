# frozen_string_literal: true

class PostsAggregator
  def self.run(params = {})
    new(params).run
  end

  Errors = Struct.new(:messages)

  def initialize(params)
    @params = params
    @errors = Errors.new({})
  end

  attr_reader :errors

  def run
    feeds_urls = Feed.pluck(:url)

    responses = *HTTPX.get(*feeds_urls)

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
