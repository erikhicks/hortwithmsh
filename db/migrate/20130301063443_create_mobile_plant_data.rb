class CreateMobilePlantData < ActiveRecord::Migration
  def change
    create_table :mobile_plant_data do |t|
      t.integer :plant_id
      t.text :data

      t.timestamps
    end
  end
end
