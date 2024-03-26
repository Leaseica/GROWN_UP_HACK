class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_sub_category, only: %i[new create]

    # GET /articles/7
  def show
    @article = Article.find(params[:id])
    session[:store] ||= []
    session[:store].unshift(@article.id)
    session[:store] = session[:store].uniq
    @subcategory = @article.sub_category
    @category = @subcategory.category
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/7/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /articles/7
  def update
    if @article.update(article_params)
      redirect_to @article, notice: "article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/7
  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_sub_category
    @sub_category = SubCategory.find(params[:sub_category_id])
  end

  def article_params
    params.require(:article).permit(
      :title,
      :description,
      :paragraph1,
      :photo,
    )
  end
end
