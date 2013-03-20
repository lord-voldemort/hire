class Student < ActiveRecord::Base
  attr_accessible :name, :preferred_industry, :preferred_location
  has_many :interviews
  has_many :employers, :through => :interviews
end
