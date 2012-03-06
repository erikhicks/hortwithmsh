class Unit < ActiveRecord::Base
  has_many :classroom_units
  has_many :classrooms, :through => :classroom_units
  has_many :materials
end
