# frozen_string_literal: true

class Feed < ApplicationRecord
  attr_readonly :title, :url

  validates :url, presence: true
  validates :title, :url, uniqueness: { case_sensitive: false }
  validate :url_format

  def url_format
    return if Twingly::URL.parse(url).valid?

    errors.add(:url, "#{@url} isn't valid")
  end
end
