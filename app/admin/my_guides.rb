ActiveAdmin.register MyGuide do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :article_id, :user_id, :business_structure, :is_micro_entrepreneur, :is_business_extension, :has_previous_self_employment, :representative_role, :representative_type, :title, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:article_id, :user_id, :business_structure, :is_micro_entrepreneur, :is_business_extension, :has_previous_self_employment, :representative_role, :representative_type, :title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  remove_filter :photo_attachment, :photo_blob

  index do
    selectable_column
    id_column
    column :article
    column :user
    column :business_structure
    column :is_micro_entrepreneur
    column :is_business_extension
    column :has_previous_self_employment
    column :representative_role
    column :representative_type
    column :title
    column :created_at
    column :photo do |my_guide|
      if my_guide.photo.attached?
        image_tag url_for(my_guide.photo), size: "100x100"
      else
        "No photo attached"
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :article
      f.input :user
      f.input :business_structure
      f.input :is_micro_entrepreneur
      f.input :is_business_extension
      f.input :has_previous_self_employment
      f.input :representative_role
      f.input :representative_type
      f.input :title
      f.input :photo, as: :file
    end
    f.actions
  end

end
