# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :loan_date, presence: true
  validates :return_by, presence: true
  validates :status, presence: true
end
