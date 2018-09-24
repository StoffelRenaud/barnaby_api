class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @places = Place.where(sql_query, query: "%#{params[:query]}%")
    else
      @places = Place.where.not(latitude: nil)
    end
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
    @place.update(params_place)
    if @place.save
      redirect_to places_path
    else
      render :edit
    end
  end

  private

  def params_place
    params.require(:place).permit(:name, :urlphoto, :distance, :address, :latitude, :longitude, :content)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
