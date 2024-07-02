class RenameTypeColumnInPlatforms < ActiveRecord::Migration[7.1]
  def change
    rename_column :platforms, :type, :platform_type
  end
end
