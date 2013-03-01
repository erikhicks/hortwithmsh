class MobileController < ApplicationController
  def index
  	
  end

  def post_plant_data
    respond_to do |format|
      format.js
    end
  end
end
