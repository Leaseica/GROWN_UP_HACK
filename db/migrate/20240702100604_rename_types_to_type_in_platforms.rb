class RenameTypesToTypeInPlatforms < ActiveRecord::Migration[7.1]
  def change
    rename_column :platforms, :types, :type
  end
end
