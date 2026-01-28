class Api::V1::LocationsController < ApplicationController
  def index
    @locations = Location.all
    render json: @locations
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      render json: @location, status: :created, location: api_v1_location_url(@location)
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end
end
