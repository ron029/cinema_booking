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
FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title }
    association :cinema, factory: :cinema
  end
end
