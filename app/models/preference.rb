class Preference < ActiveRecord::Base
  attr_accessible :interest_expressed_by, :student_id, :employer_id
  belongs_to :student
  belongs_to :employer
end
