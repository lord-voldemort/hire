class MatchesController < ApplicationController
  def show
  end

  def index
    if current_user
      if current_user.role == "Student" 
        @matches = Preference.find_student_matches(current_user.id)
      elsif current_user.role == "Employer"
        @matches = Preference.find_employer_matches(current_user.id)

      else
        @matches = Preference.find_all_matches
      end
    else
     redirect_to new_user_path
    end
      
  end

end
