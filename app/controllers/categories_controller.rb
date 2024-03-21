class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    if params[:query].present?
      @categories = @categories.where(name: params[:query])
    end
  end

  def show
    id = params[:id]
    @category = Category.find(id)
  end
end

