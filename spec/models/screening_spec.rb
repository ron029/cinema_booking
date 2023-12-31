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
#  unique_screening_constraint    (cinema_id,movie_id,date,time_slot) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (cinema_id => cinemas.id)
#  fk_rails_...  (movie_id => movies.id)
#
require 'rails_helper'
