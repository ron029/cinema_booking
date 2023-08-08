class BooksController < ApplicationController
  before_action :require_login 

  def index
    @book = Booking.all.page(params[:page])
  end

  def new
    @screening = Screening.find(params[:screening_id])
    @booking = Booking.new
  end

  def create
    @screening = Screening.find(params[:screening_id])
    @booking = @screening.bookings.build(user_id: current_user.id)

    if @booking.save
      flash[:success] = "Your booking has been save"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def require_login
    unless logged_in?
      flash[:alert] = "Please log in to book a screening."
      redirect_to login_path
    end
  end

  def booking_params
    params.require(:booking).permit(:user_id)
  end
end
