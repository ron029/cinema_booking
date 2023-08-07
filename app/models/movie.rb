# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cinema_id  :bigint           not null
#
# Indexes
#
#  index_movies_on_cinema_id  (cinema_id)
#
# Foreign Keys
#
#  fk_rails_...  (cinema_id => cinemas.id)
#
class Movie < ApplicationRecord
  belongs_to :cinema
  has_many :bookings
  has_many :users, through: :bookings

  validates :name, :cinema_id, presence: true
  # validates :name, :cinema_id, presence: true
end
