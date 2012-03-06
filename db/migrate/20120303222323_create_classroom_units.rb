class CreateClassroomUnits < ActiveRecord::Migration
  def change
    create_table :classroom_units do |t|
      t.integer :classroom_id
      t.integer :unit_id

      t.timestamps
    end
  end
end
