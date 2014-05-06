module Api
  module V1
    class SessionsController < ApplicationController
      
    
    respond_to :json

    def create
      @user = User.find_by(email: user_params[:email])
      if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
      else
        render "index"
      end
    end

    def destroy
      session.clear
      redirect_to root_url
    end

    end
  end
end