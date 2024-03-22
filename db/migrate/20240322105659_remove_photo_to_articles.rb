class RemovePhotoToArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :photo
  end
end
