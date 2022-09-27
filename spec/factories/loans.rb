# frozen_string_literal: true

FactoryBot.define do
  factory :loan do
    loan_date { '2022-08-25' }
    return_by { '2022-09-25' }
    returned_on { '2022-09-10' }
    status { 'available' }
    association :user
    association :book
  end
end
