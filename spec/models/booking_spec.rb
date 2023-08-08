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
require 'rails_helper'

RSpec.describe Booking, type: :model do

  it 'should not create a booking with a nil user_id' do
    booking = Booking.new(user_id: nil, screening_id: 1)
    expect(booking.save).to be false
  end

  it 'should not create a booking with a nil screening_id' do
    booking = Booking.new(user_id: 1, screening_id: nil)
    expect(booking.save).to be false
  end

end