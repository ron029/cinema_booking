# Frozen_string_literal: true

# This class represent the Static Pages on the app.
class StaticPagesController < ApplicationController
  def index
    @all_cinema_movies = Cinema.includes(movies: :bookings).paginate(page: params[:page], per_page: 12)

    # Filter cinemas with a booking count less than 10
    @filtered_cinemas = @all_cinema_movies.select do |cinema|
      cinema.bookings.size < 10
    end
    # .
  end
end
