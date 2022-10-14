# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :book_cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  accepts_nested_attributes_for :authors, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true

  scope :available, -> { where.not(id: Loan.books_not_returned) }
  scope :featured, ->(amount) { available.sample(amount) }

  # def authors_attributes=(authors_attributes)
  #   authors_attributes.each_value do |author_attribute|
  #     author = Author.find_or_create_by(author_attribute)
  #     authors << author
  #   end
  # end
end
