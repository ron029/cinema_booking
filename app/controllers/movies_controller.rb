# Frozen_string_literal: true

# This class represent the movie of the app.
class MoviesController < ApplicationController
  before_action :require_login, except: %i[index show]
  before_action :admin_only, except: %i[index show]

  def index
    if params[:cinema_id]
      @cinema = Cinema.find(params[:cinema_id])
      @all_movies = @cinema.movies.order(created_at: :desc).page(params[:page]).per(10)
    else
      @all_movies = Movie.order(created_at: :desc).page(params[:page]).per(10)
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
  
  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
