class User < ActiveRecord::Base
	has_many :hashcodes
	
	before_save do
		self.password_hash = Digest::SHA256.hexdigest(password_hash)
	end
	
	validates_presence_of :email, :message => 'Please provide an email address.'
	validates_presence_of :password_hash, :message => 'Please provide a password.'
	validates_confirmation_of :password_hash, :message => 'Passwords do not match.'
	validates_format_of :email, :with => /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}/, :message => 'That is not an email address!'
	validates_uniqueness_of :email, :case_sensitive => false, :message => 'There is already an account with that email address.'
	
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
