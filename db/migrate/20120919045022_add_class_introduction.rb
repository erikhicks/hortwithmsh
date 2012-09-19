class AddClassIntroduction < ActiveRecord::Migration
  def up
    add_column :classrooms, :introduction, :text
  end

  def down
    remove_column :classrooms, :introduction
  end
end
