class AddUniqueIndexToScreenings < ActiveRecord::Migration[6.0]
  def change
    add_index :screenings, [:cinema_id, :movie_id, :date, :time_slot], unique: true, name: 'unique_screening_constraint'
  end
end
