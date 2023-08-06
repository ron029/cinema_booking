class CinemasController < ApplicationController
  def index
    @cinemas_all = Cinema.all.paginate(page: params[:page], per_page: 12)
  end
end
