class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :cinema_id
    remove_column :bookings, :movie_id
  end
end
