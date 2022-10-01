# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:author) { create(:author) }
  let(:book) { create(:book) }

  it 'is valid with valid attributes' do
    expect(described_class.new(
             title: 'The Rails 5 Way', user_id: user.id, category_id: category.id
           )).to be_valid
  end

  it 'is not valid without title' do
    expect(described_class.new(
             title: 'The Rails 5 Way', category_id: category.id
           )).not_to be_valid
  end

  it 'is not valid without user_id' do
    expect(described_class.new(
             user_id: user.id, category_id: category.id
           )).not_to be_valid
  end

  it 'is not valid without category_id' do
    expect(described_class.new(
             title: 'The Rails 5 Way', user_id: user.id
           )).not_to be_valid
  end

  it 'can attach a book_cover' do
    book.book_cover.attach(
      io: Rails.root.join('spec/fixtures/files/empty.jpeg').open,
      filename: 'empty.jpeg', content_type: 'image/jpeg'
    )

    expect(book.book_cover).to be_attached
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user).without_validating_presence }
    it { is_expected.to belong_to(:category).without_validating_presence }
    it { is_expected.to have_many(:book_authors).without_validating_presence }
    it { is_expected.to have_many(:authors).without_validating_presence }
  end

  describe '.available' do
    it 'includes books that are available to loan' do
      book = create(:book)
      loan = create(:loan, book_id: book.id)
      expect(described_class.available.first.id).to eq loan.book_id
    end
  end

  describe '.featured' do
    it 'includes an array of 4 sample books' do
      create_list(:book, 5)
      expect(described_class.featured.size).to eq 4
    end
  end
end
