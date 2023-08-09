# Frozen_string_literal: true

# This class represent the bookings of the app.
class BooksController < ApplicationController
  before_action :require_login, except: %i[]
  before_action :admin_only, except: %i[new create]

  def index
    @book = Booking.all.page(params[:page])
  end

  def new
    # In your controller action
    @cinema = Cinema.find(params[:cinema_id])
    @movies = @cinema.movies

    @movie_seat_counts = {}
    @movies.each do |movie|
      @movie_seat_counts[movie.id] = {}
      movie.screenings.each do |screening|
        booked_seats = Booking.where(screening_id: screening.id).pluck(:seat_number)
        available_seats = (1..10).to_a - booked_seats
        @movie_seat_counts[movie.id][screening.time_slot] = available_seats.count
      end
    end

    @screening = Screening.find(params[:screening_id])
    @booking = Booking.new
  end

  def create
    @screening = Screening.find(params[:screening_id])
    @booking = @screening.bookings.build(booking_params)
    @booking.user_id = current_user.id

    if @booking.valid? && @booking.save
      flash[:success] = 'Your booking has been save'
      redirect_to root_url
    else
      render :new
    end
  end

  protected

  def screening_available?(screening)
    screening.cinema.bookings.count < 10
  end

  def admin_only
    unless admin?
      flash[:danger] = "Access denied. You must be an admin to perform this action."
      redirect_to login_path
    end
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Please log in to book a screening."
      redirect_to login_path
    end
  end

  def booking_params
    params.require(:booking).permit(:seat_number, :time_slot)
  end
end
