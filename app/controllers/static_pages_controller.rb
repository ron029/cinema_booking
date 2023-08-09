# Frozen_string_literal: true

# This class represent the Static Pages on the app.
class StaticPagesController < ApplicationController
  before_action :require_login, except: %i[index]
  before_action :admin_only, except: %i[index]

  def index
    if !admin?
      @cinemas = Cinema.all
      @users_in_cinemas = {}

      if current_user
        @bookings = Booking.includes(screening: [{ cinema: :movies }])
                           .where(user_id: current_user.id)
                           .order(created_at: :desc)
                           .page(params[:page]).per(3)
        @user_bookings_cinema_ids = current_user.bookings.pluck(:screening_id).map { |screening_id| Screening.find(screening_id).cinema_id }.uniq
      end
      @cinemas = Cinema.all
      @cinemas.each do |cinema|
        screenings_with_bookings = cinema.screenings.includes(:bookings)
        users_for_screenings = screenings_with_bookings.map { |screening| screening.bookings.map(&:user) }.flatten.uniq
        @users_in_cinemas[cinema] = users_for_screenings
      end

    else
      @cinema_count = Cinema.count
      @bookings_count = Booking.count
      @cinemas_with_bookings_count = Cinema.joins(:screenings => :bookings).distinct.count

      @cinemas = Cinema.includes(:screenings => { :bookings => :user }).distinct
    end
  end

  private

  def admin_only
    unless admin?
      flash[:danger] = 'Access denied. You must be an admin to perform this action.'
      redirect_to login_path
    end
  end

  def require_login
    unless logged_in?
      flash[:danger] = 'Please log in to book a screening.'
      redirect_to login_path
    end
  end
end
