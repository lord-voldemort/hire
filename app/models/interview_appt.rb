class InterviewAppt < ActiveRecord::Base
  attr_accessible :interview_id, :date_time, :type, :location, :interviewer, :comments, :follow_up
  belongs_to :interview
end
