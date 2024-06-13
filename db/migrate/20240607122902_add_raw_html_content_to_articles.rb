class AddRawHtmlContentToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :raw_html_content, :text
  end
end
