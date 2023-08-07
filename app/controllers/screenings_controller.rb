class ScreeningsController < ApplicationController
  def new
    @cinemas = Cinema.all
    @movies = Movie.all
    @screening = Screening.new
  end

  def create
    # @cinema = params[:screening][:cinema_id]
    # @movie = params[:screening][:movie_id]
    # @date = params[:screening][:date]
    # @time_slot = params[:screening][:time_slot]
    @screening = Screening.new(screening_params)

    if @screening.save
      flash[:success] = 'Screening created successfully!'
      redirect_to screenings_new_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def screening_params
    params.require(:screening).permit(:cinema_id, :movie_id, :date, :time_slot)
  end
end