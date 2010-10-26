class ApplicationController < ActionController::Base
  helper :all
  before_filter :restore_session
  
  protect_from_forgery
  
  def ensure_login
	unless @user
		redirect_to login_path
	end
  end
  
  def restore_session
	if session[:user_id]
		@user = User.find(session[:user_id])
	end
  end
end
