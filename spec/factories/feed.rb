# frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    title { Faker::Lorem.unique.sentence }
    url { Faker::Internet.unique.url }
  end
end
