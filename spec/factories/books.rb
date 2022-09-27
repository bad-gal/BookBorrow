# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'Hello World' }
    publish_date { '2022-09-25' }
    association :user
    association :category
  end
end
