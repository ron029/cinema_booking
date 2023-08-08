# Frozen_string_literal: true

# This class represent the Static Pages on the app.
class StaticPagesController < ApplicationController
  def index
    if !admin?
      if current_user
        @bookings = Booking.includes(screening: [{ cinema: :movies }]).where(user_id: current_user.id)
        @cinemas = Cinema.all
        @users_in_cinemas = {}

        @cinemas.each do |cinema|
          screenings_with_bookings = cinema.screenings.includes(:bookings)
          users_for_screenings = screenings_with_bookings.map { |screening| screening.bookings.map(&:user) }.flatten.uniq
          @users_in_cinemas[cinema] = users_for_screenings
        end

        @user_bookings_cinema_ids = current_user.bookings.pluck(:screening_id).map { |screening_id| Screening.find(screening_id).cinema_id }.uniq
      end
    else
      @cinema_count = Cinema.count
      @bookings_count = Booking.count
      @cinemas_with_bookings_count = Cinema.joins(:screenings => :bookings).distinct.count

      @cinemas = Cinema.includes(:screenings => { :bookings => :user }).distinct
    end
  end
end
