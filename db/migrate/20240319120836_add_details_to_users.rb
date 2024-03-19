class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :occupation, :string
    add_column :users, :address, :string
    add_column :users, :birthday, :date
  end
end
