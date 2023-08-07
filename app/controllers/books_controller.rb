class BooksController < ApplicationController
  def index
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      @all_book = @movie.bookings.page(params[:page]).per(10)
    elsif params[:cinema_id]
      @cinema = Cinema.find(params[:cinema_id])
      @all_book = @cinema.bookings.page(params[:page]).per(10)
    else
      @all_book = Booking.all.page(params[:page]).per(10)
    end
  end

  def show
    @booking = Booking.where('user_id=?', current_user).order(created_at: :desc).page(params[:page]).per(9)
  end

  def new
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.find(params[:movie_id])
    @book = Booking.new
    @user = User.find(current_user.id)
  end

  def create
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.find(params[:movie_id])
    @user = User.find(current_user.id)
    @book = Booking.new(book_params)
    @book.cinema_id = params[:cinema_id]
    @book.movie_id = params[:movie_id]
    @book.user_id = @user.id
    if @book.save
      flash[:success] = 'Your Booking has been save.'
      redirect_to cinema_movie_path(@book.cinema, @book.movie)
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:booking).permit(:date, :time)
  end
end
