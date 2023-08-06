# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  date       :date
#  time       :integer
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
# Frozen_string_literal: true

# This class respresent the bookings in the app
class Booking < ApplicationRecord
  before_save :convert_time_to_integer
  enum time: {
    '10 AM' => 10,
    '7 PM' => 19,
    '10 PM' => 22,
    '11 PM' => 23
    # Add more time slots as needed
  }
  belongs_to :cinema
  belongs_to :user
  belongs_to :movie

  validates :date, :time, :user_id, :cinema_id, :movie_id, presence: true

  def convert_time_to_integer
    # Ensure that the 'time' attribute is a string (e.g., '10 AM')
    return unless time.is_a?(String)

    # Convert the 'time' attribute from '10 AM' to 10
    self.time = time.split(' ')[0].to_i
  end
end
