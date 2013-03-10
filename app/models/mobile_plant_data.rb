require 'csv'

class MobilePlantData < ActiveRecord::Base

  has_one :plant, :foreign_key => :plant_id, :class_name => 'MobilePlant'

  IGNORE_HEADERS = [
    'plant-id',
    'controller',
    'action'
  ]

  def self.dump_csv
    rows = self.find(:all)

    keys = []

    # collect all keys for csv column headers
    rows.each do |row|
      JSON.parse(row.data).keys.each do |key|
        if !keys.include? key
          keys.push(key)
        end
      end
    end

    IGNORE_HEADERS.each do |key|
      keys.delete key
    end

    # generate csv headers and data
    csv = CSV.generate do |csv|
      combined_headers = ['date','plant_id','plant_name'] + keys
      csv << combined_headers
      rows.each do |row|
        data = JSON.parse(row.data)
        valid_data_array = []
        keys.each do |key|
          valid_data_array << data[key].to_s
        end
        combined_data = [
          row.created_at.strftime("%Y-%m-%d %I:%M:%S"),
          row.plant_id,
          row.plant.common_name
        ] + valid_data_array
        csv << combined_data
      end
    end

    File.open("#{Rails.root}/db/data/collected/mobile_plant_data.csv", 'w') {|f| f.write(csv) }

    return csv
  end
end
