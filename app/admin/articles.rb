ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  permit_params :title, :description, :sub_category_id, :paragraph1, :raw_html_content, :photo, :additional_resources_1, :additional_resources_2, additional_resources_1_listing: [], additional_resources_2_listing: [], platform_ids: [], my_guide_ids: []
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
      f.input :photo, as: :file
      f.input :additional_resources_1
      f.input :additional_resources_1_listing, as: :check_boxes, collection: Platform.all.map { |platform| [platform.name, platform.id] }, input_html: { multiple: true }, label: 'Additional Resources 1 listing'

      f.input :additional_resources_2
      f.input :additional_resources_2_listing, as: :check_boxes, collection: Platform.all.map { |platform| [platform.name, platform.id] }, input_html: { multiple: true }, label: 'Additional Resources 2 listing'
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :sub_category
      row :paragraph1
      row :raw_html_content
      row :created_at
      row :updated_at
      row :my_guides do |article|
        article.my_guides.map { |my_guide| my_guide.user.email }.join(', ').html_safe
      end
      row :photo do |article|
        image_tag url_for(article.photo), size: "100x100"
      end
      row :additional_resources_1, label: 'Additional Resources 1'
      row :additional_resources_1_listing, label: 'Additional Resources 1 Listing'
      row :additional_resources_2, label: 'Additional Resources 2'
      row :additional_resources_2_listing, label: 'Additional Resources 2 Listing'

    end
  end
end
