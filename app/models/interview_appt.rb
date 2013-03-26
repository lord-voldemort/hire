class InterviewAppt < ActiveRecord::Base
  attr_accessible :interview_id, :date_time, :purpose, :location, :interviewer, :comments, :follow_up
  belongs_to :interview

end
