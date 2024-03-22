class AddPhotoToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :photo, :string
  end
end
