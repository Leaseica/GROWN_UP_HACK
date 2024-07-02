class AddResourcesListingToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :additional_resources_1_listing, :string
    add_column :articles, :additional_resources_2_listing, :string
  end
end
