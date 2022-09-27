# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    first_name { 'Jane' }
    last_name { 'Dolph' }
  end

  trait :author2 do
    first_name { 'Harry' }
    last_name { 'Otterman' }
  end
end
