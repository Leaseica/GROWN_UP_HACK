class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    if params[:query].present?
      # @categories = @categories.where("name ILIKE ?", "%#{params[:query]}%")
      @categories = Category.global_search(params[:query])
    end
  end


end
