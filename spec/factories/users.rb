# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Cary' }
    last_name { 'Grant' }
    email { 'cg@example.com' }
    location { 'UK office' }
  end
end
