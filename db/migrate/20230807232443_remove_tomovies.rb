class RemoveTomovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :name, :string
  end
end
