class CreateScreenings < ActiveRecord::Migration[6.0]
  def change
    create_table :screenings do |t|
      t.date :date
      t.integer :time_slot
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
