class RemoveCinemaToMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :cinema_id
  end
end
