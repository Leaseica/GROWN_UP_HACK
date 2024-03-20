class MyGuidesController < ApplicationController
  before_action :set_article, only: %i[new]
  before_action :set_user, only: %i[new]
  before_action :set_my_guide, only: %i[show edit update destroy]

  # GET my_guides/new
  def new
    @my_guide = MyGuide.new
  end

  # GET my_guides/1
  def show
  end

  # POST /my_guides
  def create
    @my_guide = MyGuide.new(my_guide_params)
    if @my_guide.save
      redirect_to @my_guide, notice: "My Guide was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET my_guides/1/edit
  def edit
  end

  # PATCH/PUT /my_guides/1
  def update
    if @my_guide.update(my_guide_params)
      redirect_to @my_guide, notice: "My_guide was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def redirect
  end

  def destroy
    @my_guide.destroy
    redirect_to restaurant_path(@my_guide.article), status: :see_other
  end

  private

  def set_my_guide
    @my_guide = MyGuide.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def my_guide_params
    params.require(:my_guide).permit(
      :article_id,
      :occupation,
      :address,
      :social_security,
      :business_structure,
      :is_micro_entrepreneur,
      :is_business_extension,
      :has_previous_self_employment,
      :representative_role,
      :representative_type
    )
  end

end
