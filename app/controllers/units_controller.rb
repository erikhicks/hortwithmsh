class UnitsController < ClassroomsController
  before_filter :authenticate

  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
    @materials = @unit.materials
  end
end