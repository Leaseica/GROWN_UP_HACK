class RenameTitreToTitleInMyGuides < ActiveRecord::Migration[7.1]
  def change
    rename_column :my_guides, :titre, :title
  end
end
