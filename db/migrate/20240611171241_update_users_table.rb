class UpdateUsersTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :nationality, :country
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
  end
end
