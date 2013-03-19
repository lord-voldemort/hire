class Employer < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :interviews
  has_many :students, :through => :interviews
end
