class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :property
	# This is Sinatra! Remember to create a migration!
end
