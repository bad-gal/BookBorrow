# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Cary' }
    last_name { 'Grant' }
    email { 'cg@example.com' }
    password { 'pa5sw03d' }
    location { 'UK office' }
  end

  trait :user2 do
    first_name { 'Jane' }
    last_name { 'Russell' }
    email { 'jane_r@example.com' }
    password { 'pa5sw03d' }
    location { 'US office' }
  end
end
