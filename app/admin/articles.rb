ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  permit_params :title, :description, :sub_category_id, :paragraph1, :raw_html_content

  # or

  # permit_params do
  #   permitted = [:title, :description, :sub_category_id, :paragraph1, :raw_html_content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :title
  filter :description
  filter :sub_category
  filter :articles_platforms, as: :select, collection: -> { ArticlesPlatform.all }
  filter :photo_attachment, as: :boolean, label: "Has Photo" do |articles|
    articles.where.not(photo_attachment: nil)
  end
  # remove_filter :photo

end
