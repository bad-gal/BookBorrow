# frozen_string_literal: true

class User < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
