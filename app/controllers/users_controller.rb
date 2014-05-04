class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user.patients }
    end
  end
end