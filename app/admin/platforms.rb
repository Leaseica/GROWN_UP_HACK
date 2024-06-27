ActiveAdmin.register Platform do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :url, :logo, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :url, :logo, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  index do
    selectable_column
    id_column
    column :name
    column :url do |platform|
      if platform.url.present?
        link_to platform.url, platform.url
      else
        "No url attached"
      end
    end
    column :logo
    column :description
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :url
      f.input :logo
      f.input :description
    end
    f.actions
  end


end
