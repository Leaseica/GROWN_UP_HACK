class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
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
    redirect_to category_sub_categories_path(@category)
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
    @category = Category.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.find(params[:id])
    authorize @category
    if @category.update(category_params)
      redirect_to category_path(@category), notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
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




end
