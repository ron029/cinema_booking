class ChangeDatatypeToBookings < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :bookings, :time, :string
    end
  
    def down
      change_column :bookings, :time, :integer
    end
  end
end
