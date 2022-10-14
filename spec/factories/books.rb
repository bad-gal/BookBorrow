# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'Hello World' }
    publish_year { '2022' }
    association :user
    association :category
  end
end
