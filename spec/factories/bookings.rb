# == Schema Information
#
# Table name: bookings
#
#  id           :bigint           not null, primary key
#  seat_number  :integer
#  time_slot    :integer
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
FactoryBot.define do
  factory :booking do
    cinema { nil }
    user { nil }
    movie { nil }
    data_rsvn { "2023-08-06" }
    time_rsvn { 1 }
  end
end
