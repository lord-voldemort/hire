class Interview < ActiveRecord::Base
  attr_accessible :student_id, :employer_id, :status, :follow_up, :interview_appts_attributes
  belongs_to :student
  belongs_to :employer
  has_many  :interview_appts
  accepts_nested_attributes_for :interview_appts, allow_destroy: true

  
  validates :student_id, :presence => true
  validates :employer_id, :presence => true
  validates :status, :presence => true
  validates_uniqueness_of :student_id, :scope => [:employer_id], message: "Interview already exists"

  def self.find_by_sid_eid(student_id, employer_id)
      @interview = Interview.find(:first, :conditions => {:student_id => student_id, :employer_id => employer_id})  
  end
  
  def self.find_status_by_sid_eid(student_id, employer_id)
      @interview = Interview.find(:first, :conditions => {:student_id => student_id, :employer_id => employer_id})
      if @interview
        @interview.status
      else
        "Not yet scheduled"
      end
  end
  
end