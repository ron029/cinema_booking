# == Schema Information
#
# Table name: cinemas
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Cinema, type: :model do
  describe 'validations' do
    it 'should require a name' do
      cinema = Cinema.new(name: nil)
      expect(cinema).to_not be_valid
      expect(cinema.errors[:name]).to include('can\'t be blank')
    end

    it 'should have a name with a minimum length of 2 characters' do
      cinema = Cinema.new(name: 'a')
      expect(cinema).to_not be_valid
      expect(cinema.errors[:name]).to include('is too short (minimum is 2 characters)')
    end

    it 'should have a name with a maximum length of 100 characters' do
      cinema = Cinema.new(name: 'a' * 101)
      expect(cinema).to_not be_valid
      expect(cinema.errors[:name]).to include('is too long (maximum is 100 characters)')
    end
  end
end
