class StudentsController < ApplicationController
  def new
    @student = Student.new(:id => current_user.id)
  end

  def create
    @student = Student.new(params[:student])
    @student.user_id = current_user.id
    @student.email = current_user.email
    if @student.save
    redirect_to student_path(@student.id)
    else
      render 'new'
    end
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @student_companies =Employer.companies_interested_in_student(@student.id)
    @student_interest = Employer.companies_student_has_interest(@student.id)
    @matches = Student.find_matches(@student_companies, @student_interest)

  end

  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to action: :show, id: @student.id
    else
      render 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to root_path
  end


end
