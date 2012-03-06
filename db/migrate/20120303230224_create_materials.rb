class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :filename
      t.boolean :enabled
      t.integer :sort_order

      t.timestamps
    end
  end
end
