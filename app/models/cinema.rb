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
  has_many :movies
  has_many :bookings, through: :movies
end
