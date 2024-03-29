class SubCategoriesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @sub_categories = @category.sub_categories
    if params[:query].present?
      # @sub_categories = @sub_categories.where("name ILIKE ?", "%#{params[:query]}%")
      @sub_categories = SubCategory.global_search(params[:query])
    end
  end

  def show
    id = params[:id]
    @sub_category = SubCategory.find(id)
    @articles = @sub_category.articles
    if params[:query].present?
      @articles = @articles.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end
end
