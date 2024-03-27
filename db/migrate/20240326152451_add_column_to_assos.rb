class AddColumnToAssos < ActiveRecord::Migration[7.1]
  def change
    add_column :assos, :address, :string
  end
end
