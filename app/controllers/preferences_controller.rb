class PreferencesController < ApplicationController

  def new

    @preference = Preference.new
    if current_user.role == "Student"
      @preference.student_id = Student.where(:user_id => current_user.id).first.id 
      @preference.interest_expressed_by = "Student"
      @preference.employer_id = params[:format]
    elsif current_user.role == "Employer"
      #would need to adjust next line if Employers have more than 1 
      @preference.employer_id = Employer.where(:email => current_user.email).first.id
      @preference.interest_expressed_by = "Employer"
      @preference.student_id = params[:format]
    else
  
    end

  end

  def create

    @preference = Preference.new(params[:preference])
    #raise @preference.inspect
    if @preference.save
    redirect_to preference_path(@preference.id)
    else
      flash.now[:alert]
    render 'new'
    end
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
