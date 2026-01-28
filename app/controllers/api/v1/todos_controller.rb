class Api::V1::TodosController < ApplicationController
  before_action :set_location

  private

  def set_location
    @location = Location.find(params[:location_id])
  end
end
