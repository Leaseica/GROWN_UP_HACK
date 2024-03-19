class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.references :sub_category, null: false, foreign_key: true
      t.text :paragraph1

      t.timestamps
    end
  end
end
