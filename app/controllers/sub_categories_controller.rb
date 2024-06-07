class SubCategoriesController < ApplicationController
  before_action :set_category
  before_action :set_sub_category, only: [:show]

  def index
    @category = Category.find(params[:category_id])
    @sub_categories = @category.sub_categories
    if params[:query].present?
      # @sub_categories = @sub_categories.where("name ILIKE ?", "%#{params[:query]}%")
      @sub_categories = SubCategory.global_search(params[:query])
    end
  end

  def show
    @sub_category = SubCategory.find(params[:id])
    @articles = @sub_category.articles
    if params[:query].present?
      @articles = @articles.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id] || @sub_category.category_id)
  end

  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end
end
