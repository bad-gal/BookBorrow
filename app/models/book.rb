# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :book_cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  accepts_nested_attributes_for :authors, allow_destroy: true

  validates :title, presence: true

  scope :available, -> { where.not(id: Loan.books_not_returned) }
  scope :featured, ->(amount) { available.sample(amount) }
  scope :owned, ->(user_id) { where(user_id: user_id) }
  scope :not_owned, ->(user_id) { where.not(user_id: user_id) }
end
