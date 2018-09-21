class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_place, only: [:show, :edit]

  def index
    @places = Place.where.not(latitude: nil)
    @markers = @places.map do |place|
    {
      lat: place.latitude,
      lng: place.longitude
    }
    end
  end

  def show
    @place_coordinates = { lat: @place.latitude, lng: @place.longitude }
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.create(params_place)
    redirect_to places_path
  end

  def edit
  end

  def update
    raise
  end

  private

  def params_place
    params.require(:place).permit(:name, :urlphoto, :distance, :address, :latitude, :longitude)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
