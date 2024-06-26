ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :occupation, :address, :birthday, :country, :phone_number, :gender, :city, :zip_code, :title, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :occupation, :address, :birthday, :country, :phone_number, :gender, :city, :zip_code, :title, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :email
  filter :city
  filter :country
  filter :admin

  index do
    selectable_column
    id_column
    column :email
    column :city
    column :country
    column :admin
    actions
  end

  form do |f|
    f.inputs do
      f.input :admin
      f.input :email
      f.input :title, as: :select, collection: titles_list
      f.input :first_name
      f.input :last_name
      f.input :gender, as: :select, collection: genders_list
      f.input :occupation
      f.input :address
      f.input :zip_code
      f.input :city
      f.input :country
      f.input :birthday
      f.input :phone_number

    end
    f.actions
  end

end
