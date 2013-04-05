class Student < ActiveRecord::Base
  attr_accessible :name, :preferred_industry, :preferred_location, :employers_attributes, :user_id, :email
  
  has_many :interviews
  has_many :employers, :through => :interviews

  has_many :preferences
  has_many :employers, :through => :preferences, :dependent => :destroy

  accepts_nested_attributes_for :employers 


  validates :name, :presence => true
  validates :preferred_industry, :presence => true
  validates :preferred_location, :presence => true
  validates :email, :presence => true


  
  def self.find_matches(comp_int, stud_int)
   matches =[]
   comp_int.each do |match|
      if stud_int.include? match
        matches << match
      else
      end
    end
    matches
  end


  def self.from_omniauth(gmail_user)
    where(:name => gmail_user["info"]["name"]).first || create_from_omniauth(gmail_user)
  end

  def self.create_from_omniauth(gmail_user)
    user = User.create(:email => gmail_user["info"]["email"], :role => "Student")
    student = Student.new
    student.name = gmail_user["info"]["name"]
    student.email = gmail_user["info"]["email"]
    student.preferred_location = "NYC"
    student.preferred_industry = "Default"
    student.user_id = User.all.size
    student.save
  end


end
