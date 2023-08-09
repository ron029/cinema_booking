# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  admin           :string(1)
#  email           :string
#  full_name       :string
#  mobile_number   :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
# Frozen_string_literal: true

# This class represent the User Model of the app.
class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save :update_admin

  regex_email = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  VALID_EMAIL_REGEX = regex_email.freeze

  has_many :bookings
  validates :full_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :mobile_number, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  has_secure_password

  private

  def update_admin
    self.admin = User.count.zero? ? '1' : '0'
  end
end
