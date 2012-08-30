class CreateSubjectClassrooms < ActiveRecord::Migration
  def change
    create_table :subject_classrooms do |t|
      t.integer :classroom_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
