class PreferencesController < ApplicationController

  def new
    @preference = Preference.new
  end

  def create
    raise params.inspect
    @preference = Preference.new(params[:preference])
    @preference.save
    redirect_to preference_path(@preference.id)
  end
  
  def show
    @preference = Preference.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end

end
