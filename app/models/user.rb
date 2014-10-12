require 'bcrypt'
class User

	include DataMapper::Resource

	property :id, 							Serial
	property :username,					String, :unique => true
	property :name, 						String
	property :email, 						String, :required => true, :unique => true, :message => "This email is already taken"
	property :password_digest,	Text, :required => true

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password, :message => "Sorry, your passwords don't match"

	def password=(password)
		@password = password 
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(username, password)
		user = first(:username => username)
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end

end