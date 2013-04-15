class MatchesController < ApplicationController
  def show
  end

  def index
    if current_user
    @matches = Preference.find_matches
    else
    redirect_to new_user_path
    end
  end

end
