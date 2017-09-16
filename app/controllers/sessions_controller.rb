class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if authenticated?(@user) && @user.user?
      flash[:good_message] =  "Login Successful"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    elsif authenticated?(@user) && @user.admin?
      flash[:good_message] =  "Login Successful"
      session[:user_id] = @user.id
      redirect_to admin_dashboard_index_path
    else
      flash[:bad_message] = "Login Unsuccessful"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
  def authenticated?(user)
    user && user.authenticate(params[:session][:password])
  end

end
