class ChangeColumnNameToBooking < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :date_rsvn, :date
    rename_column :bookings, :time_rsvn, :time
  end
end
