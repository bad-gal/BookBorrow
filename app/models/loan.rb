# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :loan_date, presence: true
  validates :return_by, presence: true
  validates :status, presence: true

  scope :books_not_returned, -> { where(returned_on: nil).pluck(:book_id) }
  scope :borrowed_count, ->(book_id) { where(book_id: book_id).count }
  scope :outstanding, ->(user_id) { where(returned_on: nil).where(user_id: user_id) }
  scope :history, ->(user_id) { where(user_id: user_id) }
  scope :borrowed_users, -> (book_id) { where(book_id: book_id).pluck(:user_id).uniq.map{ |id| ApplicationController.helpers.user_name(User.find(id)) } }
end
