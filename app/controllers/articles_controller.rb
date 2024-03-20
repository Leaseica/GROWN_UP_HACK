class ArticlesController < ApplicationController
  before_action :set_article

    # GET /articles/7
  def show
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
  end

  # DELETE /articles/7
  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def article_params
    params.require(:article).permit(
      :title,
      :description,
      :paragraph1
    )
  end
end
