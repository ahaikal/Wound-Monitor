class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :set_access_control_headers

	def set_access_control_headers
		    headers['Access-Control-Allow-Origin'] = "*"
		    headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
 	end


  def logged_in?
  	session[:user_id]
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
