class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def show
    id = params[:id]
    @category = Category.find(id)
  end
end
