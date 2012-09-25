class Classroom < ActiveRecord::Base
  has_many :classroom_units
  has_many :units, :through => :classroom_units
  has_one :subject, :primary_key => :subject_id, :foreign_key => :id

  default_scope order("sort asc")

  def self.all_sorted
    Classroom.find(:all, :order => 'sort asc')
  end

  def self.find_by_url(path)
    Classroom.find(:first, :conditions => ["lower(name) = ?", path.gsub('-',' ')])
  end

  def name_url
    return name.downcase.gsub(' ','-')
  end

  def html_description
    return self.description.html_safe
  end
end
