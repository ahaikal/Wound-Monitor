class UsersController < ActionController::Base

  def show
    @user = User.find(session[:user_id])
  end
end