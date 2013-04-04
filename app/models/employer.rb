class Employer < ActiveRecord::Base
  attr_accessible :name, :industry, :location, :est_year, :students_attributes, :homepage_url, :funding, :number_of_employees, :description
  
  has_many :interviews
  has_many :students, :through => :interviews

  has_many :preferences
  has_many :students, :through => :preferences, :dependent => :destroy

  accepts_nested_attributes_for :students

  validates :name, :presence => true
  
end
