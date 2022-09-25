# frozen_string_literal: true

class Author < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
end
