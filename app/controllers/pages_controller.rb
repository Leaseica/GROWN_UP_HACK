class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :components ]

  def home
  end

  def components
  end

  def search
    @query = params[:query]
    PgSearch.multisearch(@query)
  end

end
