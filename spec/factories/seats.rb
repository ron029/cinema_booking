# == Schema Information
#
# Table name: seats
#
#  id         :bigint           not null, primary key
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :seat do
    available { false }
  end
end
