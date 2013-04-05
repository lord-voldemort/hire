class Employer < ActiveRecord::Base
  attr_accessible :name, :industry, :location, :est_year, :students_attributes, :homepage_url, :funding, :number_of_employees, :description, :user_id
  
  has_many :interviews
  has_many :students, :through => :interviews

  has_many :preferences
  has_many :students, :through => :preferences, :dependent => :destroy

  accepts_nested_attributes_for :students

  validates :name, :presence => true
  

  def self.companies_interested_in_student(student_id)
    x =[]
    Preference.where(:student_id => student_id).each do |n|
      if Preference.find(n.id).interest_expressed_by == "Employer"
      x << Employer.find(n.employer_id)
      else
      end
    end
    x
  end

  def self.companies_student_has_interest(student_id)
    x =[]
    Preference.where(:student_id => student_id).each do |n|
      if Preference.find(n.id).interest_expressed_by == "Student"
       x << Employer.find(n.employer_id)
      else
      end
    end
    x
  end
end
