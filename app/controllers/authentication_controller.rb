class AuthenticationController < ApplicationController
	def login
		@user = User.authenticate_without_password_hash(params[:username], params[:password])
		
		unless @user.nil?
			session[:user_id] = @user.id
			
			redirect_to hashcodes_path
		end
	end
	
	def logout
		if @user
			session[:user_id] = nil
			
			redirect_to root_path
		else
			raise 
		end
	end
	
	def register
		@user = User.new(params[:user])
		
		if @user.valid? and @user.save
			session[:user_id] = @user.id
			
			redirect_to root_path
		end
	end
end
