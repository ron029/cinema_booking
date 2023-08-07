# == Schema Information
#
# Table name: cinemas
#
#  id           :bigint           not null, primary key
#  availability :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :cinema do
    name { Faker::Lorem.words(number: 2).join(' ').truncate(30) }
    availability { rand(0..1) == 0 ? 'Fully Booked' : 'Available' }
  end
end
