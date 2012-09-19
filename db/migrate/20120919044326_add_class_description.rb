class AddClassDescription < ActiveRecord::Migration
  def up
    add_column :classrooms, :description, :text
  end

  def down
    remove_column :classrooms, :description
  end
end
