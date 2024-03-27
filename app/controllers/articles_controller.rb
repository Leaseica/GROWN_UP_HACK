class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_sub_category, only: %i[new create]
  before_action :session_store, only: %i[show]

    # GET /articles/7
  def show
    @article = Article.find(params[:id])
    @subcategory = @article.sub_category
    @category = @subcategory.category
    @assos = Asso.all
    # The `geocoded` scope filters only assos with coordinates
    @markers = @assos.geocoded.map do |asso|
      {
        lat: asso.latitude,
        lng: asso.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { asso: asso })
      }
    end
  end

  def session_store
    session[:store] << params[:id] unless session[:store].include?(params[:id])
    session[:store] = session[:store].last(5) if session[:store].size > 5
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
