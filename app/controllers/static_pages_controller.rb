# Frozen_string_literal: true

# This class represent the Static Pages on the app.
class StaticPagesController < ApplicationController
  def index
    @cinema = Cinema.left_outer_joins(:bookings, :movies)
                    .where(availability: '1')
                    .group(:id)
                    .having('COUNT(bookings.id) <= 10')
                    .order(Arel.sql('COUNT(bookings.id) DESC, COUNT(movies.id) DESC'))
                    .page(params[:page])
                    .per(12)
  end
end
