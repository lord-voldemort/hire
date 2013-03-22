class MatchesController < ApplicationController
def show
end

def index
@preferences = Preference.all
end

end
