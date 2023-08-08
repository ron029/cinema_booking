class RemoveToCinema < ActiveRecord::Migration[6.0]
  def change
    remove_column :cinemas, :availability, :integer
  end
end
