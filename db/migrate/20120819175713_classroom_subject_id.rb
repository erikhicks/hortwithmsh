class ClassroomSubjectId < ActiveRecord::Migration
  def up
    add_column :classrooms, :subject_id, :integer
  end

  def down
    remove_column :classrooms, :subject_id
  end
end
