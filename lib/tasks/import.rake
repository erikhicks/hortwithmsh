require 'csv'

namespace :import do
  task :mobile_plants => :environment do
    MobilePlant.delete_all
    csv_text = File.read("#{Rails.root}/db/data/mobile_plants.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      mobile_plant = MobilePlant.create(
        :plant_id => row[0], 
        :common_name => row[1], 
        :botanical_name => row[2], 
        :information => row[3], 
        :facts => row[4],
        :usda_nutrition => row[5]
      )
      mobile_plant.save
      puts mobile_plant.common_name
    end
  end
end