class ChangeScreening < ActiveRecord::Migration[6.0]
  def change
    add_reference :screenings, :cinema, null: false, foreign_key: true
    add_reference :screenings, :movie, null: false, foreign_key: true
  end
end
