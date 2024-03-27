class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :status
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true
      t.references :my_guide, null: false, foreign_key: true

      t.timestamps
    end
  end
end
