class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :mobile_number
      t.string :password_digest
      t.column :admin, :char, limit: 1

      t.timestamps
    end
  end
end
