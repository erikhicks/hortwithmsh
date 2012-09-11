class ClassroomsController < ApplicationController
  before_filter :authenticate

  def index
    @classrooms = Classroom.all_sorted
  end

  def create
    @classroom = Classroom.create(:name => params[:class_name])
    @classroom.save
    classrooms = render_to_string(:partial => 'index_classroom', :collection => Classroom.all_sorted)

    respond_to do |format|
      format.js { @classrooms = classrooms }
    end
  end

  def edit
    classroom = Classroom.find(params[:classroom_id])
    
    classroom.update_attributes(params[:classroom])
    
    respond_to do |format|
      format.js { @results = {:message => 'Classroom details updated.', :classroom => classroom} }
    end
  end

  def add_unit
    classroom = Classroom.find(params[:classroom_id])

    if !params[:unit][:id].empty?
      unit = Unit.find(params[:unit][:id])
    else
      unit = Unit.create(:name => params[:name])
    end

    classroom.units << unit
    classroom.save

    units_html = render_to_string(:partial => 'units/index_unit', :collection => classroom.units, :layout => false)

    respond_to do |format|
      format.js { @results = {:message => 'Unit added to classroom.', :classroom => classroom, :units => units_html} }
    end
  end

  def show
    @classroom = Classroom.find(params[:id])
    @all_units = Unit.find(:all)
  end

  def delete
    classroom = Classroom.find(params[:classroom_id])
    classroom.delete
    classrooms_html = render_to_string(:partial => 'classrooms/index_classroom', :collection => Classroom.all_sorted, :layout => false)

    respond_to do |format|
      format.js { @results = {:message => 'Classrooms updated.', :classrooms => classrooms_html} }
    end
  end
end
