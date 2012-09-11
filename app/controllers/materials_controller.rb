class MaterialsController < ApplicationController
  before_filter :authenticate

  def create
    unit = Unit.find(params[:unit_id])

    new_material = Material.new(params[:material])
    new_material.save_file({:file => params[:file]})

    unit.materials << new_material
    materials = render_to_string(:partial => 'index_material', :collection => unit.materials)

    respond_to do |format|
      format.js { @results = {:message => 'New unit material added.', :materials => materials} }
    end
  end
end
