class HydroponicsDataController < ClassroomsController
  before_filter :authenticate

  def index
    
  end

  def download
    send_data MobilePlantData.dump_csv, :type => 'text/csv', :filename => 'All Student Plant Data.csv'
  end
end