ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  remove_filter :photo_attachment, :photo_blob

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :created_at
    column :updated_at
    column :photo do |category|
      if category.photo.attached?
        image_tag url_for(category.photo), size: "100x100"
      else
        "No photo attached"
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :photo, as: :file
    end
    f.actions
  end

end
