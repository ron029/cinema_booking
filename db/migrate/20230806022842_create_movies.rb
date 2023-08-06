class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.references :cinema, null: false, foreign_key: true

      t.timestamps
    end
  end
end
