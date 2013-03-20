class EmployersController < ApplicationController
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(params[:employer])
    @employer.save
    redirect_to employers_path
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
  
end
