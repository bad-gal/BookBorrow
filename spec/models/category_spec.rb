# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    expect(described_class.new(topic: 'Computing')).to be_valid
  end
end
