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

  def delete
    material = Material.find(params[:material_id])
    unit = material.unit

    material.delete_file
    unit.materials.delete(material)
    materials_html = render_to_string(:partial => 'materials/index_material', :collection => unit.materials, :layout => false)

    respond_to do |format|
      format.js { @results = {:message => 'Unit updated, material removed.', :materials => materials_html} }
    end
  end

  def edit_name
    material = Material.find(params[:material_id])

    material.name = params[:material_name]
    material.save

    unit = Unit.find(params[:unit_id])

    materials_html = render_to_string(:partial => 'materials/index_material', :collection => unit.materials, :layout => false)

    respond_to do |format|
      format.js { @results = {:message => 'Unit material renamed.', :materials => materials_html} }
    end
  end
end
