# frozen_string_literal: true

class Feed < ApplicationRecord
  include LambdaUploader::Attachment(:logo)

  attr_readonly :title

  validates :url, presence: true
  validates :title, :url, uniqueness: { case_sensitive: false }
  validate :url_format

  def url_format
    return if Twingly::URL.parse(url).valid?

    if Rails.env.test?
      last_host_segment = Addressable::URI.heuristic_parse(url)&.host&.split('.')&.last
      return if %w[example test].include?(last_host_segment)
    end

    errors.add(:url, "#{@url} isn't valid")
  end
end
