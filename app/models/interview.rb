class Interview < ActiveRecord::Base
  attr_accessible :student_id, :employer_id, :interview_date, :interview_location, :status, :follow_up
  belongs_to :student
  belongs_to :employer
end
