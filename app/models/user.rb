require_relative '../../config/database'
require 'bcrypt'
#require 'byebug'
class User < ActiveRecord::Base
	has_many :properties
	has_many :comments
	has_many :bookings
	include BCrypt
	# attr_accessor :password
	#means you remove it from the column... 
	# This is Sinatra! Remember to create a migration!
# validates :email, uniqueness: true
# validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	before_create :encrypt_password
	attr_accessor :password
	#this is to call encrypt_password before saving. Before_save is a method..

	# def has_password?(submitted_password)
 #  	self.password == submitted_password
 #  	end

	def encrypt_password
		#byebug
		self.encrypted_password = BCrypt::Password.create(self.password) unless encrypted_password
	end
	# This is Sinatra! Remember to create a migration!
end
