class User < ActiveRecord::Base
	has_many :hashcodes
	
	validates_presence_of :email
	validates_presence_of :password_hash
	validates_confirmation_of :password_hash
	validates_format_of :email, :with => /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}/
	validates_uniqueness_of :email, :scope => :id, :case_sensitive => false
	
	def self.authenticate_without_password_hash(username, password)
		if password.nil? or password.empty?
			return nil
		end
		
		# Just hash the fucker and get outta here.
		password_hash = Digest::SHA256.hexdigest(password)
		
		return authenticate_with_password_hash(username, password_hash)
	end
	
	def self.authenticate_with_password_hash(username, password_hash)
		return find(:first, :conditions => "email = '#{username}' AND password_hash = '#{password_hash}'")
	end
end
