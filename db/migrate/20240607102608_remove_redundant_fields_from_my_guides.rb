class RemoveRedundantFieldsFromMyGuides < ActiveRecord::Migration[7.1]
  def change
    remove_column :my_guides, :occupation, :string
    remove_column :my_guides, :address, :string
    remove_column :my_guides, :phone_number, :string
  end
end
