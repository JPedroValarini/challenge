class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :username, :string
    add_column :users, :role, :string
  end
end
