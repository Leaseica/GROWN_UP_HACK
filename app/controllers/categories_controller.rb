class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
    if params[:query].present?
      # @categories = @categories.where("name ILIKE ?", "%#{params[:query]}%")
      @categories = Category.global_search(params[:query])
    end
  end

  def show
    @category = Category.find(params[:id])
    @sub_categories = @category.sub_categories
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    if @category.update(category_params)
      redirect_to category_path(@category), notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @category
    if @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to categories_url, alert: 'Error in deleting the category.' }
        format.json { render json: { error: 'Error in deleting the category' }, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to categories_url, alert: 'Category not found.' }
      format.json { render json: { error: 'Category not found' }, status: :not_found }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :photo)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
