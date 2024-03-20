class AddDetails2ToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nationality, :string
    add_column :users, :social_security, :string
  end
end
