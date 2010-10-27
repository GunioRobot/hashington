class AuthenticationController < ApplicationController
	def login
		@user = User.authenticate(params[:email], params[:password])
		
		unless @user.nil?
			redirect_to hashcodes_path
		end
	end
	
	def logout
		if @user
			# logout
		else
			#raise something
		end
	end
	
	def register
		
	end
end
