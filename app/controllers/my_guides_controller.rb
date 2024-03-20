class MyGuidesController < ApplicationController
  before_action :set_article
  before_action :set_user
  before_action :set_my_guide

  def new
    @my_guide = MyGuide.new
  end

  def create
    @my_guide = MyGuide.new(my_guide_params)
    @my_guide.article = @my_guide
    if @my_guide.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @my_guide.update(my_guides_params)
      redirect_to @my_guide, notice: "My_guides was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def redirect
  end

  private

  def set_my_guide
    @my_guide = MyGuide.find(params[:my_guide_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def my_guides_params
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
