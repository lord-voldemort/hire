class MatchesController < ApplicationController
def show
end

def index
  @matches = Preference.find_matches
end

end
