# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'is valid with valid attributes' do
    expect(described_class.new(first_name: 'Thomas', last_name: 'Smith')).to be_valid
  end

  it 'is not valid without first name' do
    expect(described_class.new(last_name: 'Smith')).not_to be_valid
  end

  it 'is not valid without last name' do
    expect(described_class.new(first_name: 'Thomas')).not_to be_valid
  end

  describe 'Associations' do
    it { is_expected.to have_many(:book_authors).without_validating_presence }
    it { is_expected.to have_many(:books).without_validating_presence }
  end
end
