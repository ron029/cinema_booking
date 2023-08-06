class BooksController < ApplicationController
  def index
    redirect_to new_cinema_movie_book_path(params[:cinema_id], params[:movie_id])
  end

  def show
    @booking = Booking.includes(:cinema, :movie).find(params[:id])

    # Access the cinema name and movie name for the specific booking
    @cinema_name = @booking.cinema.name
    @movie_name = @booking.movie.name
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
      redirect_to cinema_movie_book_path(@book.cinema, @book.movie, @book)
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:booking).permit(:date, :time)
  end
end
