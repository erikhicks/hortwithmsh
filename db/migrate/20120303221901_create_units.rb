class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.integer :sort_order
      t.boolean :enabled

      t.timestamps
    end
  end
end
