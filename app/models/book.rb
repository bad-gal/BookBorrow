# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :book_cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  validates :title, presence: true

  scope :available, -> { where.not(id: Loan.books_not_returned) }
  scope :featured, ->(amount) { available.sample(amount) }
end
