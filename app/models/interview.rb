class Interview < ActiveRecord::Base
  attr_accessible :student_id, :employer_id, :status, :follow_up, :interview_appts_attributes
  belongs_to :student
  belongs_to :employer
  has_many  :interview_appts
  accepts_nested_attributes_for :interview_appts

  
  validates :student_id, :presence => true
  validates :employer_id, :presence => true
  validates :status, :presence => true
  validates_uniqueness_of :student_id, :scope => [:employer_id], message: "Interview already exists"
end
