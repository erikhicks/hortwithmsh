class Classroom < ActiveRecord::Base
  has_many :classroom_units
  has_many :units, :through => :classroom_units

  def self.all_sorted
    Classroom.find(:all, :order => 'created_at desc')
  end
end
