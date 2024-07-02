ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  permit_params :title, :description, :sub_category_id, :paragraph1, :raw_html_content, :photo, :additional_resources_1, :additional_resources_2, platform_ids: [], my_guide_ids: []

  # or

  # permit_params do
  #   permitted = [:title, :description, :sub_category_id, :paragraph1, :raw_html_content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :title
  filter :description
  filter :sub_category
  filter :platforms, as: :select, collection: -> { Platform.all }
  filter :created_at
  filter :updated_at
  filter :paragraph1
  filter :raw_html_content
  filter :my_guides, as: :select, collection: -> { MyGuide.all.map { |my_guide| [my_guide.user.email, my_guide.id] } }





  index do
    selectable_column
    id_column
    column :title
    column :description
    column :sub_category
    column :paragraph1
    column :raw_html_content
    column :created_at
    column :updated_at
    column :my_guides do |article|
      article.my_guides.map { |my_guide| my_guide.user.email }.join(', ').html_safe
    end
    column :platforms do |article|
      article.platforms.map { |platform| platform.name }.join(', ').html_safe
    end
    column :photo do |article|
      image_tag url_for(article.photo), size: "100x100"
    end
    column :additional_resources_1
    column :additional_resources_2

    actions
  end

  remove_filter :photo

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :sub_category
      f.input :paragraph1
      f.input :raw_html_content
      f.input :platforms, as: :select, collection: Platform.all
      f.input :photo, as: :file
      f.input :additional_resources_1
      f.input :additional_resources_2
    end
    f.actions
  end
end
