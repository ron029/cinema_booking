class RemoveBookingIdFromScreenings < ActiveRecord::Migration[6.0]
  def change
    remove_column :screenings, :booking_id
  end
end
