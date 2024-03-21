class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    if params[:query].present?
      @categories = @categories.where(name: params[:query])
    end
  end

 
end
