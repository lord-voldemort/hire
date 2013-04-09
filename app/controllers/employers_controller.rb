class EmployersController < ApplicationController
  
  def new
    @employer = Employer.new(:id => current_user.id)
  end

  def create
    @employer = Employer.new(params[:employer])
    @employer.user_id = current_user.id
    @employer.email = current_user.email
    if @employer.save
      if current_user.role == "Employer"
        redirect_to students_path
      else
        redirect_to employers_path(@employer.id)
      end
    else
    render 'new'
    end 
  end

  def index
    @employers = Employer.all
  end

  def show
    @employer = Employer.find(params[:id])
  end

  def edit
    @employer = Employer.find(params[:id])
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
    @employer = Employer.find(params[:id])
    @employer.destroy
    redirect_to employers_path
  end

  def employer_selection_modal
    render :employer_selection_modal, :layout => false
  end

end
