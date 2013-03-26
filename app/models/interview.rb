class Interview < ActiveRecord::Base
  attr_accessible :student_id, :employer_id, :interview_date, :interview_location, 
  :status, :follow_up, :interview_appts_attributes
  belongs_to :student
  belongs_to :employer
  has_many  :interview_appts
  accepts_nested_attributes_for :interview_appts
end
