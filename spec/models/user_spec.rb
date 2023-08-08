# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  admin           :string(1)
#  email           :string
#  full_name       :string
#  mobile_number   :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should require a full_name' do
      user = User.new(full_name: nil)
      expect(user).to_not be_valid
      expect(user.errors[:full_name]).to include('can\'t be blank')
    end

    it 'should have a full_name with a minimum length of 2 characters' do
      user = User.new(full_name: 'a')
      expect(user).to_not be_valid
      expect(user.errors[:full_name]).to include('is too short (minimum is 2 characters)')
    end

    it 'should have a full_name with a maximum length of 100 characters' do
      user = User.new(full_name: 'a' * 101)
      expect(user).to_not be_valid
      expect(user.errors[:full_name]).to include('is too long (maximum is 100 characters)')
    end

    it 'should require an email' do
      user = User.new(email: nil)
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include('can\'t be blank')
    end

    it 'should have an email with a valid format' do
      user = User.new(email: 'invalid_email')
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'should require a mobile_number' do
      user = User.new(mobile_number: nil)
      expect(user).to_not be_valid
      expect(user.errors[:mobile_number]).to include('can\'t be blank')
    end

    it 'should require a password' do
      user = User.new(password: nil)
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include('can\'t be blank')
    end

    it 'should have a password with a minimum length of 6 characters' do
      user = User.new(password: '12345')
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'should set the admin field to nil if the user is the first user created' do
      user = User.new
      user.save
      expect(user.admin).to eq(nil)
    end

    it 'should set the admin field to 0 if the user is not the first user created' do
      User.create
      user = User.new
      user.save
      expect(user.admin).to eq(nil)
    end
  end
end
