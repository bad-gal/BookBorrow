# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookAuthor, type: :model do
  let(:book) { create(:book) }
  let(:author) { create(:author) }

  it 'is valid with valid attributes' do
    expect(described_class.new(book_id: book.id, author_id: author.id)).to be_valid
  end

  it 'is not valid without book_id' do
    expect(described_class.new(author_id: author.id)).not_to be_valid
  end

  it 'is not valid without author_id' do
    expect(described_class.new(book_id: book.id)).not_to be_valid
  end

  context 'with validations' do
    let(:author2) { create(:author, :author2) }

    it 'disallows the same author from being an author on the same book twice' do
      described_class.create(book_id: book.id, author_id: author.id)
      expect(described_class.new(book_id: book.id, author_id: author.id)).not_to be_valid
    end

    it 'allows a book to have more than one author' do
      described_class.create(book_id: book.id, author_id: author.id)
      expect(described_class.new(book_id: book.id, author_id: author2.id)).to be_valid
    end
  end
end
