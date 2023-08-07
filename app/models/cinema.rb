# == Schema Information
#
# Table name: cinemas
#
#  id           :bigint           not null, primary key
#  availability :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
# Frozen_string_literal: true

class Cinema < ApplicationRecord
  enum availability: {
    'Fully Booked' => 0,
    'Available' => 1
  }

  has_many :movies, dependent: :nullify
  has_many :bookings, through: :movies
  has_many :screenings
  validates :name, :availability, presence: true
end
