class InterviewsController < ApplicationController
  def new
    if current_user
      if current_user.role == "Student"
        @student = Student.where(:user_id => current_user.id).first
        @upcoming_interviews = Interview.upcoming_interviews(@student,current_user.role)
        @interview = Interview.new(params[:interview])
        @interview.student_id = @student.id
        @interview.interview_appts.build
      else
        @employer = Employer.where(:email => current_user.email).first
        @upcoming_interviews = Interview.upcoming_interviews(@employer,current_user.role)
        @interview = Interview.new(params[:interview])
        @interview.employer_id = @employer.id
        @interview.interview_appts.build
      end
    else
    redirect_to new_user_path
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
    if current_user
    @interviews = Interview.all
    else
    redirect_to new_user_path
    end
  end

  def show
    if current_user
    @interview = Interview.find(params[:id])
    else
    redirect_to new_user_path
    end
  end

  def edit
    if current_user
    @interview = Interview.find(params[:id])
    @student = Student.find(@interview[:student_id])
    @employer = Employer.find(@interview[:employer_id])
    else
    redirect_to new_user_path
    end
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
    if current_user
    @interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to action: :index
    else
    redirect_to new_user_path
    end
  end


end
