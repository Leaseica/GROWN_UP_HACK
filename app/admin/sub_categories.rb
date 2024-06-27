ActiveAdmin.register SubCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :category_id, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  remove_filter :photo_attachment, :photo_blob
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :category
    column :created_at
    column :photo do |sub_category|
      if sub_category.photo.attached?
        image_tag url_for(sub_category.photo), size: "100x100"
      else
        "No photo attached"
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :description
      f.input :photo, as: :file
    end
    f.actions
  end


end
