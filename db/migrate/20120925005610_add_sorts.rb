class AddSorts < ActiveRecord::Migration
  def up
    add_column :classrooms, :sort, :integer, :default => 0
    add_column :units, :sort, :integer, :default => 0
    add_column :materials, :sort, :integer, :default => 0
  end

  def down
    remove_column :classrooms, :sort
    remove_column :units, :sort
    remove_column :materials, :sort
  end
end
