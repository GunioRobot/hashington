module ApplicationHelper
	def is_logged_in?
		@current_user || false
	end
end
