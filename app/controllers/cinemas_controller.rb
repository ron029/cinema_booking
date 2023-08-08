class CinemasController < ApplicationController
  before_action :require_admin, only: %i[create edit new update destroy]
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

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "Access denied. You must be an admin to perform this action."
      redirect_to root_path
    end
  end

  def cinema_params
    params.require(:cinema).permit(:name)
  end
end
