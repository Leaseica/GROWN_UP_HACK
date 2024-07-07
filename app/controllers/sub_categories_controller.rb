class SubCategoriesController < ApplicationController
  before_action :set_category
  before_action :set_sub_category, only: [:show]
  before_action :authenticate_user!, except: %i[index show]

  def index

    @sub_categories = @category.sub_categories
    if params[:query].present?
      # @sub_categories = @sub_categories.where("name ILIKE ?", "%#{params[:query]}%")
      @sub_categories = SubCategory.global_search(params[:query])
    end
  end

  def show
    # 1. Fetch all articles belonging to the sub-category.
    @articles = @sub_category.articles

    # 2. Initialize a new Article object.
    # This is done to ensure @article is available for policy check in the view.
    @article = Article.new

    # Render the view
    if params[:query].present?
      @articles = @articles.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  def new
    @sub_category = SubCategory.new
    # @article = Article.new(sub_category: @sub_category)
    # authorize @article
  end
  private

  def set_category
    @category = Category.find(params[:category_id] || @sub_category.category_id)
  end

  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end
end
