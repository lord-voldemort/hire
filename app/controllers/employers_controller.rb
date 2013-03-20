class EmployersController < ApplicationController
  def new

  end

  def create

  end

  def index
    @employers = Employer.all
  end
  def show
    @students = Student.all
    @employer = Employer.find(params[:id])
  end

end
