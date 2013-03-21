class PreferencesController < ApplicationController

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(params[:preference])
    @preference.save
    redirect_to preference_path(@preference.id)
  end
  
  def index
    @preferences = Preference.all
  end

  def show
    @preference = Preference.find(params[:id])
  end
  
  def edit
    @preference = Preference.find(params[:id])
  end
  
  def update
    @preference = Preference.find(params[:id])
    if @preference.update_attributes(params[:preference])
      redirect_to action: :show, id: @preference.id
    else
      render 'edit'
    end
  end
  
  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy
    redirect_to preferences_path
  end

end
