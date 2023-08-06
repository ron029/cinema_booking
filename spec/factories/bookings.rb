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
