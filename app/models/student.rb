class Student < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :interviews
  has_many :employers, :through => :interviews
end
