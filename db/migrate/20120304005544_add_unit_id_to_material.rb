class AddUnitIdToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :unit_id, :integer

  end
end
