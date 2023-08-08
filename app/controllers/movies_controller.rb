class MoviesController < ApplicationController
  before_action :require_admin, only: %i[create edit new update destroy]
  def index
    if params[:cinema_id]
      @cinema = Cinema.find(params[:cinema_id])
      @all_movies = @cinema.movies.page(params[:page]).per(12)
    else
      @all_movies = Movie.page(params[:page]).per(12)
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = 'New movie has been saved.'
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
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

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "Access denied. You must be an admin to perform this action."
      redirect_to root_path
    end
  end
  
  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
