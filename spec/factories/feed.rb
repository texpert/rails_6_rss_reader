# frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    title { 'Interesting Feed' }
    url { Faker::Internet.url }
  end
end
