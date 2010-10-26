class User < ActiveRecord::Base
	has_many :hashcodes
	
	def self.authenticate(username, password)
		find(:first, :conditions => "email = '#{username}' AND password_hash = '#{password}'")
	end
end
