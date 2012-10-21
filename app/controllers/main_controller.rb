class MainController < ApplicationController
  before_filter :get_classrooms

  def about
    about_text = Setting.find_by_key('about')
    @about_text = about_text.nil? ? '' : about_text.value
  end

  def index
  	@meta_description = 'Horticulture and Plant Science with Ms. Hitchcock at Monroe High School, Monroe, WA.  Learn about Ms. Hitchcock\'s curriculum, FFA activities and STEM program grant.'
  end

  def plant_sale
  	@meta_description = 'Information about the 2012 Monroe FFA Plant Sale at Monroe High School, Monroe WA.  Find dates, hours of the sale and prices for this year\'s collection of plants grown and tended by students at Monroe High School.'
  end

  def get_classrooms
    @classrooms = Classroom.all
  end

  def classroom
    @classroom = Classroom.find_by_url(params[:name])
  end

  def download
    classroom = Classroom.find_by_url(params[:class_name])
    classroom.units.each do |unit|
      unit.materials.each do |material|
        if material.name_url == params[:file_name]
          #response.headers['Content-Disposition'] = "attachment; filename=\"#{material.name}.#{material.extension}\""
          extname = material.extension
          mime_type = Mime::Type.lookup_by_extension(extname)
          content_type = mime_type.nil? ? "application/octet-stream" : mime_type.to_s
          send_file "#{Rails.root}/public/materials/#{material.filename}", :type => content_type, :filename => "#{material.name}#{material.extension}"
        end
      end
    end
  end
end
