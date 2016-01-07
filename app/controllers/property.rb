require_relative '../models/property'
#require_relative '../models/answer'
#require 'byebug'

post '/properties' do
	# byebug
	@property = Property.create(property: params[:property], user_id: session[:user_id])
	#byebug
	redirect to '/properties'
#user.encrypted_password = BCrypt::Password.create(params[:user][:password])
	#use .create then it aytomatically saves 
	#redirect to '/questions'
	# else 
	# 	p "Error, please try again"
	# end 	
	#when you redirect, you need to redirect to a complete string
	#
end 

# authentication method is below 
get '/properties' do
	@properties = Property.all 	
	@current_user = session[:user_id]
	erb :"static/mainpage"
end 

get '/properties/:user_id' do
	# byebug
	@user = User.find(session[:user_id])
	@properties = Property.all 
	@my_properties = @user.properties
	@current_user = session[:user_id]
	erb :"static/my_property"
end 

delete '/properties/:property_id' do
	@property = Property.find(params[:property_id])
	@property.delete
	redirect to '/properties/:user_id'
end 


get '/properties/:user_id' do
	@property = Property.find(params[:property_id])
	erb :"static/my_property"
end 

patch '/properties/:property_id' do
	@my_property = Property.find(params[:property_id])
	@my_property.update(property: params[:update])
    redirect to '/properties/:user_id'
end


# get '/my_questions/:id/edit' do
# 	@question = Question.find(params[:id])
# 	erb :"static/myquestions"
# end 

# patch '/my_questions/:question_id' do
# 	@question = Question.find(params[:question_id])
# 	@question.update(params[:question])
#     redirect to '/my_questions/:question_id'
# end
