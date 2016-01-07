class Property < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :bookings
	# This is Sinatra! Remember to create a migration!
end
