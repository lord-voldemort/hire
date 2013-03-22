class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
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
