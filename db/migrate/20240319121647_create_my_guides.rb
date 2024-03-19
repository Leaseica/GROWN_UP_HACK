class CreateMyGuides < ActiveRecord::Migration[7.1]
  def change
    create_table :my_guides do |t|
      t.references :article, null: false, foreign_key: true
      t.string :occupation
      t.string :address
      t.string :social_security
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
