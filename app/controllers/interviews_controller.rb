class InterviewsController < ApplicationController
  def new
    @interview = Interview.new(params[:interview])
    3.times do
      @interview.interview_appts.build
  end
  end

  def create
   
    # params[:interview][:interview_appts]["date_time"] = (params[:interview][:interview_appts]["date_time(1i)"] +"-"+ params[:interview][:interview_appts]["date_time(2i)"] +"-"+ params[:interview][:interview_appts]["date_time(3i)"] +"-"+ params[:interview][:interview_appts]["date_time(4i)"] +":"+ params[:interview][:interview_appts]["date_time(5i)"])
    # params[:interview][:interview_appts].delete("date_time(1i)")
    # params[:interview][:interview_appts].delete("date_time(2i)")
    # params[:interview][:interview_appts].delete("date_time(3i)")
    # params[:interview][:interview_appts].delete("date_time(4i)")
    # params[:interview][:interview_appts].delete("date_time(5i)")
    #raise params.inspect
    @interview = Interview.new(params[:interview])
    debugger
    #@interview.interview_appts.build(params[:interview][:interview_appts])
    
    
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
