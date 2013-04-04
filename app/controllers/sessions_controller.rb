class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    student = Student.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to student_path(student.id)
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out!"
    redirect_to new_session_url
  end

  def oauth
    student = Student.from_omniauth(request.env["omniauth.auth"])
    session[:student_id] = student.id
    redirect_to student_path(student.id), notice: "Signed in!"
  end

end
