class Admin::UsersController < Admin::BaseController

  def edit
  end

  def update

    if current_user.update(user_params)
      flash[:good_message] = "You've successfully updated your Account"
      redirect_to admin_dashboard_index_path
    else
      flash[:bad_message] = "Update failed"
      render :edit
    end
      
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end

end
