class AddTypesToPlatforms < ActiveRecord::Migration[7.1]
  def change
    add_column :platforms, :types, :string
  end
end
