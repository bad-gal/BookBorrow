# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:book) { create(:book) }

  it 'is valid with valid attributes' do
    expect(described_class.new(loan_date: Time.now.utc, return_by: 1.month.from_now.end_of_month,
                               status: 'on_loan', user_id: book.user_id, book_id: book.id)).to be_valid
  end

  it 'is not valid without loan_date' do
    expect(described_class.new(return_by: 1.month.from_now.end_of_month,
                               status: 'on_loan', user_id: book.user_id, book_id: book.id)).not_to be_valid
  end

  it 'is not valid without return_by' do
    expect(described_class.new(loan_date: Time.now.utc,
                               status: 'on_loan', user_id: book.user_id, book_id: book.id)).not_to be_valid
  end

  it 'is not valid without status' do
    expect(described_class.new(loan_date: Time.now.utc, return_by: 1.month.from_now.end_of_month,
                               user_id: book.user_id, book_id: book.id)).not_to be_valid
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user).without_validating_presence }
    it { is_expected.to belong_to(:book).without_validating_presence }
  end

  describe '.books_not_returned' do
    it 'includes book ids that have a returned_on date of nil' do
      create(:loan, book_id: book.id, user_id: book.user_id, returned_on: nil)
      expect(described_class.books_not_returned).to eq [book.id]
    end
  end
end
