class Unit < ActiveRecord::Base
  has_many :classroom_units
  has_many :classrooms, :through => :classroom_units
  has_many :materials

  default_scope order("ID DESC")
end
