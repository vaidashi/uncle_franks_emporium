class UsersController < ApplicationController
  before_action :require_current_user, except: [:create]

  def show

  end


  def edit
   if current_user.id != params[:id].to_i
     render file: "/public/404"
   end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:good_message] = "Successful Account Creation"
      redirect_to dashboard_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if current_user.update(user_params)
      flash[:good_message] = "Successfully Updated Account"
      redirect_to dashboard_path
    else
      flash[:bad_message] = "Update failed"
      redirect_to edit_user_path(current_user)
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
