class Classroom < ActiveRecord::Base
  has_many :classroom_units
  has_many :units, :through => :classroom_units
  has_one :subject, :primary_key => :subject_id, :foreign_key => :id

  def self.all_sorted
    Classroom.find(:all, :order => 'created_at desc')
  end

  def self.find_by_url(path)
    Classroom.find(:first, :conditions => ["lower(name) = ?", path.gsub('-',' ')])
  end

  def name_url
    return name.downcase.gsub(' ','-')
  end
end
