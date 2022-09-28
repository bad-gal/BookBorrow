# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :book_cover
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  validates :title, presence: true
end
