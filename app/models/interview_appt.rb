class InterviewAppt < ActiveRecord::Base
  attr_accessible :interview_id, :date_time, :purpose, :location, :interviewer, :comments, :follow_up, :employer_id, :student_id
  belongs_to :interview

end
