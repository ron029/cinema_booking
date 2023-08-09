# == Schema Information
#
# Table name: seats
#
#  id         :bigint           not null, primary key
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Seat < ApplicationRecord
  
end
