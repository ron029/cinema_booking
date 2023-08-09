# Frozen_string_literal: true

# This class represent the cinemas in the app.
class CinemasController < ApplicationController
  before_action :require_login, except: %i[index show]
  before_action :admin_only, except: %i[index show]

  def index
    @cinemas = Cinema.all.page(params[:page]).per(10)
  end

  def new
    @cinema = Cinema.new
  end

  def create
    @cinema = Cinema.new(cinema_params)
    if @cinema.save
      flash[:success] = 'New Cinema has been save.'
      redirect_to cinema_path(@cinema)
    else
      render :new
    end
  end

  def show
    # @movie = Movie.find(params[:movie_id]) if params[:movie_id]
    @cinema = Cinema.find(params[:id])
  end

  def edit
    @cinema = Cinema.find(params[:id])
  end

  def update
    @cinema = Cinema.find(params[:id])
    if @cinema.update(cinema_params)
      flash[:success] = "#{@cinema.name} has been updated"
      redirect_to cinema_path(@cinema)
    else
      render :edit
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

  def cinema_params
    params.require(:cinema).permit(:name)
  end
end
