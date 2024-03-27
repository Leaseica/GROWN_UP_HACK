class CreateAssos < ActiveRecord::Migration[7.1]
  def change
    create_table :assos do |t|
      t.string :name
      t.string :photo
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
