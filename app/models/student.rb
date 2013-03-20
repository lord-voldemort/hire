class Student < ActiveRecord::Base
  attr_accessible :name, :preferred_industry, :preferred_location, :employers_attributes
  has_many :interviews
  has_many :employers, :through => :interviews

  has_many :preferences
  has_many :employers, :through => :preferences


  accepts_nested_attributes_for :employers 
end
