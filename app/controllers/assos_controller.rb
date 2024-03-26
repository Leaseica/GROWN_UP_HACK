class AssosController < ApplicationController
  def show
    @assos = Asso.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @assos.geocoded.map do |asso|
      {
        lat: asso.latitude,
        lng: asso.longitude
      }
    end
  end
