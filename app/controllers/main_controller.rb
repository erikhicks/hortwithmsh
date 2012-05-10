class MainController < ApplicationController
  def index
  	@meta_description = 'Horticulture and Plant Science with Ms. Hitchcock at Monroe High School, Monroe, WA.  Learn about Ms. Hitchcock\'s curriculum, FFA activities and STEM program grant.'
  end

  def plant_sale
  	@meta_description = 'Information about the 2012 Monroe FFA Plant Sale at Monroe High School, Monroe WA.  Find dates, hours of the sale and prices for this year\'s collection of plants grown and tended by students at Monroe High School.'
  end
end
