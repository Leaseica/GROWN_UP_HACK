class SearchesController < ApplicationController

  def search
    @query = params[:query]
    @results = PgSearch.multisearch(@query)
  end
end
