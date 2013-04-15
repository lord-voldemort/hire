class EmployersController < ApplicationController
  
  def new
    @employer = Employer.new(:id => current_user.id)
  end

  def create
    @employer = Employer.new(params[:employer])
    @employer.user_id = current_user.id
    @employer.email = current_user.email
    if @employer.save
      redirect_to students_path
    else
      render 'new'
    end 
  end

  def index
    if current_user
    @employers = Employer.all
    else
    redirect_to new_user_path
    end
  end

  def show
    if current_user
    @employer = Employer.find(params[:id])
    @student_interest = Student.students_interested_in_employer(@employer.id)
    @employer_interest = Student.students_employer_has_interest(@employer.id)
    @matches = Employer.find_matches(@student_interest, @employer_interest)
    @upcoming_interviews = Interview.upcoming_interviews(@employer, current_user.role)
    else
    redirect_to new_user_path
    end
  end

  def edit
    if current_user
    @employer = Employer.find(params[:id])
    else
    redirect_to new_user_path
    end
  end
  
  def update
    @employer = Employer.find(params[:id])
    if @employer.update_attributes(params[:employer])
      redirect_to action: :show, id: @employer.id
    else
      render 'edit'
    end
  end
  
  def destroy
    if current_user
    @employer = Employer.find(params[:id])
    @employer.destroy
    redirect_to employers_path
    else
    redirect_to new_user_path
    end
  end

  def employer_selection_modal
    render :employer_selection_modal, :layout => false
  end

end
