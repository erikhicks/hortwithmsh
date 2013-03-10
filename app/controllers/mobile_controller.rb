class MobileController < ApplicationController
  def index
  	
  end

  def post_plant_data
    mobile_plant_data = MobilePlantData.create(:plant_id => params["plant-id"].to_i, :data => params.to_json)
    mobile_plant_data.save
    respond_to do |format|
      format.js
    end
  end

  def get_plant_information
    mobile_plant = MobilePlant.find_by_plant_id(params[:id])

    respond_to do |format|
      format.js { @results = {:plant => mobile_plant.to_json } }
    end
  end
end
