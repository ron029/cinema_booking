# == Schema Information
#
# Table name: cinemas
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cinema < ApplicationRecord
  has_many :screenings
  has_many :movies, through: :screenings
  has_many :bookings, through: :screenings

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
end
