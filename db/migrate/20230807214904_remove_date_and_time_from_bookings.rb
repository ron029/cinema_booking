class RemoveDateAndTimeFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :date
    remove_column :bookings, :time
  end
end
