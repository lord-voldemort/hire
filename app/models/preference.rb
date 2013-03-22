class Preference < ActiveRecord::Base
  attr_accessible :interest_expressed_by, :student_id, :employer_id
  belongs_to :student
  belongs_to :employer

  validates :interest_expressed_by, :presence => true
  validates :student_id, :presence => true
  validates :employer_id, :presence => true

end
