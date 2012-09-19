class UnitsController < ClassroomsController
  before_filter :authenticate

  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
    @materials = @unit.materials
  end

  def delete
    unit = Unit.find(params[:unit_id])
    classroom = unit.classrooms.first

    unit.classrooms.each do |classroom|
      classroom.units.delete(unit)
    end

    if classroom
      units_modified = classroom.units
    else
      units_modified = Unit.find(:all)
    end

    unit.materials.each do |material|
      material.delete_file
      material.delete
    end

    unit.delete

    units_html = render_to_string(:partial => 'units/index_unit', :collection => units_modified, :layout => false)

    respond_to do |format|
      format.js { @results = {:message => 'Unit removed.', :units => units_html} }
    end
  end
end