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
  

  def self.upcoming_interviews(person, role)
    if role == "Student"
      upcoming_interviews = Interview.includes(:interview_appts).where(:status => "Active", :student_id => person.id)
    else
      upcoming_interviews = Interview.includes(:interview_appts).where(:status => "Active", :employer_id => person.id)
    end
    upcoming_interviews.collect! {|itv| itv.interview_appts.collect! {|x|x}} 
    upcoming_interviews.flatten! 
    upcoming_interviews.sort!{|x,y|x.date_time <=> y.date_time}
  end
  
end