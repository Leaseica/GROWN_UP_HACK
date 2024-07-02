class AddCustomFieldsToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :additional_resources_1, :string
    add_column :articles, :additional_resources_2, :string
  end
end
