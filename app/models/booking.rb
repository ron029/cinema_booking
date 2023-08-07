# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cinema_id  :bigint           not null
#  movie_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_bookings_on_cinema_id  (cinema_id)
#  index_bookings_on_movie_id   (movie_id)
#  index_bookings_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cinema_id => cinemas.id)
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (user_id => users.id)
#

# This class respresent the bookings in the app
class Booking < ApplicationRecord
  before_save :count_cinema_booking
  after_save :lock_cinema_seat

  enum time: {
    '10 AM' => 10,
    '7 PM' => 19,
    '10 PM' => 22,
    '11 PM' => 23
  }

  belongs_to :cinema
  belongs_to :user
  belongs_to :movie
  has_many :screenings
  belongs_to :screening

  validates :date, :time, presence: true

  def count_cinema_booking
    if cinema.bookings.count >= 10
      errors.add(:base, "You're trying to book in a Fully Booked Cinema")
      throw(:abort)
    end
  end

  def lock_cinema_seat
    if cinema.bookings.count == 10
      cinema.update_attribute('availability', 'Fully Booked')
    end
  end
end
