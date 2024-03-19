class CreateArticlesPlatforms < ActiveRecord::Migration[7.1]
  def change
    create_table :articles_platforms do |t|
      t.references :article, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
