class ClassroomsController < ApplicationController
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

  def show
    @classroom = Classroom.find(params[:id])
  end
end
