# == Schema Information
#
# Table name: screenings
#
#  id         :bigint           not null, primary key
#  date       :date
#  time_slot  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cinema_id  :bigint           not null
#  movie_id   :bigint           not null
#
# Indexes
#
#  index_screenings_on_cinema_id  (cinema_id)
#  index_screenings_on_movie_id   (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (cinema_id => cinemas.id)
#  fk_rails_...  (movie_id => movies.id)
#
class Screening < ApplicationRecord
  enum time_slot: {
    '10 AM' => 10,
    '7 PM' => 19,
    '10 PM' => 22,
    '11 PM' => 23
  }
  belongs_to :cinema
  belongs_to :movie
  has_many :booking
  validates :date, :time_slot, :cinema_id, :movie_id, presence: true
end
