class MoviesController < ApplicationController
  def index
    @movies_all = Movie.all.paginate(page: params[:page], per_page: 12)
  end

  def show
    if params[:cinema_id]
      @movie = Movie.where('cinema_id=? AND id=?', params[:cinema_id], params[:id])
      @cinema = Cinema.find(params[:cinema_id])
      @seat = Booking.where('cinema_id=?', params[:id])
    else
      fail
    end
  end
end
