class UnitsController < ClassroomsController
  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
    @materials = @unit.materials
  end
end