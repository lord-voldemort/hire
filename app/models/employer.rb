class Employer < ActiveRecord::Base
  attr_accessible :name, :industry, :location, :est_year, :students_attributes
  has_many :preferences
  has_many :students, :through => :preferences
  accepts_nested_attributes_for :students

  has_many :interviews
  has_many :students, :through => :interviews
  accepts_nested_attributes_for :students
end
