class UsersController < ActionController::Base

  def show
    @user = User.find(session[:user_id])
    user_path
  end
end