class CreatePlatforms < ActiveRecord::Migration[7.1]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :url
      t.string :logo
      t.text :description

      t.timestamps
    end
  end
end
