class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.boolean :available, :boolean, default: false

      t.timestamps
    end
  end
end
