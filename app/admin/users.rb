ActiveAdmin.register User do
  # Specify parameters which should be permitted for assignment
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :occupation, :address, :birthday, :country, :phone_number, :gender, :city, :zip_code, :title, :admin

  # or consider:
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :occupation, :address, :birthday, :country, :phone_number, :gender, :city, :zip_code, :title, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :email
  filter :encrypted_password
  filter :reset_password_token
  filter :reset_password_sent_at
  filter :remember_created_at
  filter :created_at
  filter :updated_at
  filter :first_name
  filter :last_name
  filter :occupation
  filter :address
  filter :birthday
  filter :country
  filter :phone_number
  filter :gender
  filter :city
  filter :zip_code
  filter :title
  filter :admin

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :email
    column :encrypted_password
    column :reset_password_token
    column :reset_password_sent_at
    column :remember_created_at
    column :created_at
    column :updated_at
    column :first_name
    column :last_name
    column :occupation
    column :address
    column :birthday
    column :country
    column :phone_number
    column :gender
    column :city
    column :zip_code
    column :title
    column :admin
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :email
      row :encrypted_password
      row :reset_password_token
      row :reset_password_sent_at
      row :remember_created_at
      row :created_at
      row :updated_at
      row :first_name
      row :last_name
      row :occupation
      row :address
      row :birthday
      row :country
      row :phone_number
      row :gender
      row :city
      row :zip_code
      row :title
      row :admin
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :email
      f.input :encrypted_password
      f.input :reset_password_token
      f.input :reset_password_sent_at
      f.input :remember_created_at
      f.input :first_name
      f.input :last_name
      f.input :occupation
      f.input :address
      f.input :birthday
      f.input :country
      f.input :phone_number
      f.input :gender
      f.input :city
      f.input :zip_code
      f.input :title
      f.input :admin
    end
    f.actions
  end
end
