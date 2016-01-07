require_relative '../models/comment'
#require_relative '../models/answer'
#require 'byebug'

# authentication method is below 
get '/comments' do
	@comments = Comment.all 
	erb :"static/comment"
end 

post '/comments/new' do 
	comment = Comment.new(property_id: params[:property_id], comment: params[:comment], user_id: session[:user_id])
	success = comment.save
	if success
		redirect '/properties'
	end
end
