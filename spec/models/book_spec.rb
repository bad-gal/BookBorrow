# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:author) { create(:author) }

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

  describe 'Associations' do
    it { is_expected.to belong_to(:user).without_validating_presence }
    it { is_expected.to belong_to(:category).without_validating_presence }
    it { is_expected.to have_many(:book_authors).without_validating_presence }
    it { is_expected.to have_many(:authors).without_validating_presence }
  end
end
