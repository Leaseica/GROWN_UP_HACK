class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show] # Devise authentication
  after_action :verify_authorized, except: [:index, :show]  # Pundit authorization
  after_action :verify_policy_scoped, only: [:index]

  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_sub_category, only: %i[new create edit update]
  before_action :session_store, only: %i[show]
  before_action :set_breadcrumbs, only: [:show]

  # GET /articles
  def index
    @articles = policy_scope(Article)
  end

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
    authorize @article
  end

  def session_store
    session[:store] << params[:id] unless session[:store].include?(params[:id])
    session[:store] = session[:store].last(5) if session[:store].size > 5
  end
  # GET /articles/new
  def new
    @article = Article.new(sub_category: @sub_category)
    authorize @article
  end

  # GET /articles/7/edit
  def edit
    authorize @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @subcategory = @article.sub_category
    authorize @article
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /articles/7
  def update
    authorize @article
    if @article.update(article_params)
      redirect_to @article, notice: "article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/7
  def destroy
    @article = Article.find(params[:id])
    sub_category_id = @article.sub_category_id
    authorize @article
    if @article.destroy
      respond_to do |format|
        format.html { redirect_to sub_category_path(sub_category_id), notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to articles_url, alert: 'Error in deleting the article.' }
        format.json { render json: { error: 'Error in deleting the article' }, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to articles_url, alert: 'Article not found.' }
      format.json { render json: { error: 'Article not found' }, status: :not_found }
    end
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_sub_category
    if params[:sub_category_id]
      @sub_category = SubCategory.find(params[:sub_category_id])
    else
      @sub_category = @article.sub_category
    end
  end

  def article_params
    params.require(:article).permit(
      :title,
      :description,
      :paragraph1,
      :photo,
      :sub_category_id,
      :raw_html_content
    )
  end
end
