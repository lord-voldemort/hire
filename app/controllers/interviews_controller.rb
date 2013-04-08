class InterviewsController < ApplicationController
  def new
    if current_user.role == "Student"
      @student = Student.where(:user_id => current_user.id).first
      @upcoming_interviews = Interview.upcoming_interviews(@student,current_user.role)
      @interview = Interview.new(params[:interview])
      @interview.student_id = @student.id
      @interview.interview_appts.build
    else
      @employer = Employer.where(:user_id => current_user.id).first
      @upcoming_interviews = Interview.upcoming_interviews(@employer,current_user.role)
      @interview = Interview.new(params[:interview])
      @interview.employer_id = @employer.id
      @interview.interview_appts.build
    end
    
    
    #@student = Student.where(:user_id => current_user.id).first
    #@employer = Employer.where(:user_id => current_user.id).first
  end

  def create
    @interview = Interview.new(params[:interview])
    if @interview.save
    redirect_to interview_path(@interview.id)
    else
      render 'new'
    end
  end

  def index
    @interviews = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def edit
    @interview = Interview.find(params[:id])
  end
  
  def update
    @interview = Interview.find(params[:id])
    if @interview.update_attributes(params[:interview])
      redirect_to action: :show, id: @interview.id
    else
      render 'edit'
    end
  end
  
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to root_path
  end


end
