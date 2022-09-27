# frozen_string_literal: true

FactoryBot.define do
  factory :book_author do
    book { book.id }
    author { author.id }
  end
end
