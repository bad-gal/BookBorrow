# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(described_class.new(
             first_name: 'Umar',
             last_name: 'Hudson',
             email: 'umar@example.com',
             password: 'pa5sw03d'
           )).to be_valid
  end

  it 'is not valid without first name' do
    expect(described_class.new(
             last_name: 'Hudson',
             email: 'umar@example.com',
             password: 'pa5sw03d'
           )).not_to be_valid
  end

  it 'is not valid without last name' do
    expect(described_class.new(
             first_name: 'Umar',
             email: 'umar@example.com',
             password: 'pa5sw03d'
           )).not_to be_valid
  end

  it 'is not valid without email' do
    expect(described_class.new(
             first_name: 'Umar',
             last_name: 'Hudson',
             password: 'pa5sw03d'
           )).not_to be_valid
  end

  it 'is not valid without a password' do
    expect(described_class.new(
             first_name: 'Umar',
             last_name: 'Hudson',
             email: 'umar@example.com'
           )).not_to be_valid
  end
end
