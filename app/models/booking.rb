# == Schema Information
#
# Table name: bookings
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  screening_id :bigint
#  user_id      :bigint           not null
#
# Indexes
#
#  index_bookings_on_screening_id  (screening_id)
#  index_bookings_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (screening_id => screenings.id)
#  fk_rails_...  (user_id => users.id)
#

# This class respresent the bookings in the app
class Booking < ApplicationRecord
  before_save :check_and_cancel_booking

  enum time: {
    '10 AM' => 10,
    '7 PM' => 19,
    '10 PM' => 22,
    '11 PM' => 23
  }

  belongs_to :user
  belongs_to :screening

  validates :user_id, :screening_id, presence: true

  private

  def check_and_cancel_booking
    if screening.cinema.bookings.count >= 10
      errors.add(:base, "The cinema is fully booked for this screening.")
      throw :abort
    end
  end
end