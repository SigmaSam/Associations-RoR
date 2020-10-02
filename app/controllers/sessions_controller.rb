class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to events_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to events_path, notice: "Logged out!"
  end


  def attend
    attend = Attendance.new
    attend.user_id = session[:user_id]
    attend.event_id = params[:id]
    attend.save
    redirect_to events_path
  end

end
