class AddColumnToMyGuides < ActiveRecord::Migration[7.1]
  def change
    add_column :my_guides, :titre, :string
  end
end
