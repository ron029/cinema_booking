class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :cinema, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.date :data_rsvn
      t.integer :time_rsvn

      t.timestamps
    end
  end
end
