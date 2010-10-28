class AuthenticationController < ApplicationController
	def login
		@user = User.authenticate_without_password_hash(params[:username], params[:password])
		
		unless @user.nil?
			session[:user_id] = @user.id
			
			redirect_to hashcodes_path
		end
	end
	
	def logout
		unless @current_user.nil?
			session[:user_id] = nil
			
			redirect_to root_path
		else
			raise 
		end
	end
	
	def register
		if request.post?
			@user = User.new(params[:user])
		end
		
		if not @user.nil? and (@user.valid? and @user.save)
			session[:user_id] = @user.id
			
			redirect_to root_path
		end
	end
end
