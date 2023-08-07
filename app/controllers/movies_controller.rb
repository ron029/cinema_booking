class MoviesController < ApplicationController
  def index
    if params[:cinema_id]
      @cinema = Cinema.find(params[:cinema_id])
      @all_movies = @cinema.movies.page(params[:page]).per(12)
    else
      @all_movies = Movie.page(params[:page]).per(12)
    end
  end

  def new
    @cinema = params[:cinema_id] ? Cinema.find(params[:cinema_id]) : Cinema.new
    @movie = @cinema.movies.new
    @q = Cinema.ransack(params[:q])
  end

  def create
    @cinema = params[:cinema_id] ? Cinema.find(params[:cinema_id]) : Cinema.new
    @movie = @cinema.movies.build(movie_params)
    @q = Cinema.ransack(params[:q])
    if @movie.save
      flash[:success] = 'New movie has been saved.'
      if params[:cinema_id]
        redirect_to cinema_movies_path(@cinema)
      else
        redirect_to movies_path
      end
    else
      if params[:cinema_id]
        render :new, locals: { cinema: @cinema }
      else
        render :new
      end
    end
  end

  def show
    if params[:cinema_id] && params[:id]
      @cinema = Cinema.find(params[:cinema_id])
      @movie = Movie.find(params[:id])
    elsif params[:cinema_id]
      @movie = Movie.where('cinema_id=? AND id=?', params[:cinema_id], params[:id])
      @cinema = Cinema.find(params[:cinema_id])
      @seat = Booking.where('cinema_id=?', params[:id])
    else
      @movie = Movie.find(params[:id])
    end
  end

  def edit
    if params[:cinema_id]
      @movie = Movie.find(params[:id])
      @cinema = Cinema.find(params[:cinema_id])
    else
      @movie = Movie.find(params[:id])
    end
  end

  def update
    if params[:cinema_id]
      @cinema = Cinema.find(params[:cinema_id])
      @movie = @cinema.movies.find(params[:id])
    else
      @movie = Movie.find(params[:id])
    end

    if @movie.update(movie_params)
      flash[:success] = 'Movie has been updated'
      if params[:cinema_id]
        redirect_to cinema_movies_path(@cinema)
      else
        redirect_to movie_path(@movie)
      end
    else
      if params[:cinema_id]
        render :edit, locals: { cinema: @cinema }
      else
        render :edit
      end
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :cinema_id)
  end
end
