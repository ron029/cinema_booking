# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Movie < ApplicationRecord

  has_many :screenings
  has_many :cinemas, through: :screenings

  validates :title, presence: true, length: { minimum: 2, maximum: 200 }
  validates :description, presence: true
  # validates :name, :cinema_id, presence: true
end
