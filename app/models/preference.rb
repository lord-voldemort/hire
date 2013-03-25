class Preference < ActiveRecord::Base
  attr_accessible :interest_expressed_by, :student_id, :employer_id
  belongs_to :student
  belongs_to :employer

  validates :interest_expressed_by, :presence => true
  validates :student_id, :presence => true
  validates :employer_id, :presence => true

  def self.find_matches
    matches = []
    Preference.all.sort.each do |p|  
      s = Student.find(p.student_id)
      e = Employer.find(p.employer_id)
      
      Preference.where(:student_id => s.id, :employer_id => e.id).each do |n|        
        if n.interest_expressed_by != p.interest_expressed_by
          new_pair = [s.name, e.name, s.id, e.id]
            unless matches.include? new_pair
              matches << new_pair
            end
        else
        end
      end
    end
    return matches
  end

end
