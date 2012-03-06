class AddUrlToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :url, :string

  end
end
