class CreateMobilePlants < ActiveRecord::Migration
  def change
    create_table :mobile_plants do |t|
      t.integer :plant_id
      t.string :common_name
      t.string :botanical_name
      t.text :information
      t.text :facts
      t.text :usda_nutrition

      t.timestamps
    end
  end
end
