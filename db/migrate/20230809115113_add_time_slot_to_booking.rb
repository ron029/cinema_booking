class AddTimeSlotToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :time_slot, :integer
    add_column :bookings, :seat_number, :integer
  end
end
