class PreferencesController < ApplicationController

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(params[:preference])
    @preference.save
    redirect_to preferences_path
  end
  
  def show
  end
  
  def update
  end
  
  def destroy
  end

end
