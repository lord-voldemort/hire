class Employer < ActiveRecord::Base
  attr_accessible :name, :industry, :location, :est_year
  has_many :interviews
  has_many :students, :through => :interviews
end
