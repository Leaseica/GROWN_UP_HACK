ActiveAdmin.register Reminder do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :url, :status, :start_time, :end_time, :user_id, :my_guide_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :url, :status, :start_time, :end_time, :user_id, :my_guide_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  index do
    selectable_column
    id_column
    column :title
    column :description
    column :url
    column :status
    column :start_time
    column :end_time
    column :user
    column :my_guide
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :url
      f.input :status
      f.input :start_time
      f.input :end_time
      f.input :user
      f.input :my_guide
    end
    f.actions
  end


end
