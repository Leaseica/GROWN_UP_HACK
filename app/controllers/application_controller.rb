class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  before_action :initialize_session_store

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_breadcrumbs, unless: -> { controller_name == "pages" && action_name == "home" || controller_name == "users" }

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def initialize_session_store
    session[:store] ||= []
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def set_breadcrumbs
    add_breadcrumb '<i class="fa-solid fa-house"></i>'.html_safe, :root_path

    # test juste pour categories
    if controller_name == "categories"
      add_breadcrumb "Toutes les catégories"

    elsif controller_name == "sub_categories" && action_name == "index"
      add_breadcrumb "Toutes les catégories", categories_path
      if params[:category_id]
        @category = Category.find(params[:category_id])
        add_breadcrumb @category.name

      elsif params[:id]
        @category = Category.find(params[:id])
        add_breadcrumb @category.name, category_path(@category)
        @sub_category = SubCategory.find(params[:id])
        add_breadcrumb @sub_category.name
      end

    elsif controller_name == "sub_categories" && action_name == "show"
      add_breadcrumb "Toutes les catégories", categories_path
      if params[:category_id]
        @category = Category.find(params[:category_id])
        add_breadcrumb @category.name, category_sub_categories_path(@category)
        @sub_category = SubCategory.find(params[:id])
        add_breadcrumb @sub_category.name
      elsif params[:id]
        @category = Category.find(params[:id])
        add_breadcrumb @category.name, category_sub_categories_path(@category)
        @sub_category = SubCategory.find(params[:id])
        add_breadcrumb @sub_category.name
      end

    # elsif controller_name == "articles"
      #   add_breadcrumb "Toutes les catégories", categories_path
      # if params[:article_id]
      #   @article = Article.find(params[:article_id])
      # @article = Article.find(params[:id])
      # @sub_category = @article.sub_category
      # @category = @sub_category.category
      # add_breadcrumb @category.name, category_sub_categories_path(@category)
      # add_breadcrumb @sub_category.name, sub_category_path(@sub_category)
      # add_breadcrumb @article.title, article_path(@article)
    end
  end



end
