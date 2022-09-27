# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'Hello World' }
    publish_date { '2022-09-25' }
    user_id { 1 }
    category_id { 1 }
  end
end
