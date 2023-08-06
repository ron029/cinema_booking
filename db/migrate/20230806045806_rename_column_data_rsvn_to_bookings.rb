class RenameColumnDataRsvnToBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :data_rsvn, :date_rsvn
  end
end
