# Frozen_string_literal: true

# This class represent the screening in the app.
class ScreeningsController < ApplicationController
  before_action :require_login, except: %i[]
  before_action :admin_only, except: %i[]

  def new
    @cinemas = Cinema.all
    @movies = Movie.all
    @screening = Screening.new
  end

  def create
    @cinemas = params[:screening][:cinema_id]
    @movies = params[:screening][:movie_id]
    @screening = Screening.new(screening_params)

    if @screening.valid? && @screening.save
      flash[:success] = 'Screening created successfully!'
      redirect_to screenings_new_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def admin_create_booking_denied
    if admin?
      flash[:danger] = 'Access denied. Administrator don\'t allow to create bookings. Use other account to continue the Magic!'
      redirect_to root_url
    end
  end

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

  def screening_params
    params.require(:screening).permit(:cinema_id, :movie_id, :date, :time_slot)
  end
end