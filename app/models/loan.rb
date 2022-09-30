# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :loan_date, presence: true
  validates :return_by, presence: true
  validates :status, presence: true

  scope :books_not_returned, -> { where(returned_on: nil).pluck(:book_id) }
end
