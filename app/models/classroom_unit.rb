class ClassroomUnit < ActiveRecord::Base
  belongs_to :unit
  belongs_to :classroom
end
