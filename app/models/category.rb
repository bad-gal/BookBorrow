# frozen_string_literal: true

class Category < ApplicationRecord
  validates :topic, presence: true
end
