class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      if @user.role == "Student"
      redirect_to new_student_path(@user), notice: "Account created!"
      else
      redirect_to new_employer_path(@user), notice: "Account created!"
      end
    else
      render "new"
    end
  end
end
