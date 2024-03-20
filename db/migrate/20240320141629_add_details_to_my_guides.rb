class AddDetailsToMyGuides < ActiveRecord::Migration[7.1]
  def change
    add_column :my_guides, :business_structure, :string
    add_column :my_guides, :is_micro_entrepreneur, :boolean
    add_column :my_guides, :is_business_extension, :boolean
    add_column :my_guides, :has_previous_self_employment, :boolean
    add_column :my_guides, :representative_role, :string
    add_column :my_guides, :representative_type, :string
  end
end
