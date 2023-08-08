class AddTitleDescriptionToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :title, :string
    add_column :movies, :description, :text
  end
end
