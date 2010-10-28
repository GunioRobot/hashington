module ApplicationHelper
	def is_logged_in?
		not @current_user.nil?
	end
end
