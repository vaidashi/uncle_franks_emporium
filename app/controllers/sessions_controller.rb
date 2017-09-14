class SessionsController < ApplicationController
  def new
    render :layout=>false
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      flash[:good_message] =  "Login Successful"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:bad_message] = "Login Unsuccessful"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
