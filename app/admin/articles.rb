ActiveAdmin.register Article do
  # Specify parameters which should be permitted for assignment
  permit_params :title, :description, :sub_category_id, :paragraph1, :raw_html_content

  # or consider:
  #
  # permit_params do
  #   permitted = [:title, :description, :sub_category_id, :paragraph1, :raw_html_content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :title
  filter :description
  filter :sub_category
  filter :paragraph1
  filter :created_at
  filter :updated_at
  filter :raw_html_content

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :title
    column :description
    column :sub_category
    column :paragraph1
    column :created_at
    column :updated_at
    column :raw_html_content
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :title
      row :description
      row :sub_category
      row :paragraph1
      row :created_at
      row :updated_at
      row :raw_html_content
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :title
      f.input :description
      f.input :sub_category
      f.input :paragraph1
      f.input :raw_html_content
    end
    f.actions
  end
end
