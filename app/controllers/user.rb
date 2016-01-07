require_relative '../models/user'
require 'byebug'

post '/users' do
# post '/signup'
	
	user = User.new(full_name: params[:user][:fullname], email: params[:user][:email], password: params[:user][:password])
	#byebug
#user.encrypted_password = BCrypt::Password.create(params[:user][:password])
	user.save
	redirect to '/'
	# else 
	# 	p "Error, please try again"
	# end 	
end 

# authentication method is below 
post '/session' do
# post '/login'
	#byebug
	@user = User.find_by_email(params[:user][:email])
	if BCrypt::Password.new(@user.encrypted_password) == params['user']['password']
	session[:user_id] = @user.id
		# OR if@user.authenticate(params[:password])
		#use .new to create a new instance of the encrypted_password, then we compare with the value and use the function ==. 
		#change from string to BCrypt object, then we can use BCrypt method on it. 
	redirect to '/session'
	# session ['user_id'] = user.id 
	# redirect '/sucess'
	else 
	redirect to '/'
	end 	
end 

# get '/session/new' do 
# # get '/session/new'
# 	# byebug
# 		@properties = Property.all 
# 	 erb :"static/mainpage"
# end

# get '/sucess' do
# 	user = User.find_by_id(session['user_id'])
# 	if user
# 		"sucess"
# 	else 
# 		redirect '/'
# 	end 
# end 

# get '/logout' do
get '/session' do 
	#byebug
	@properties = Property.all
	@current_user = session[:user_id]
	erb :"static/mainpage"
end 

delete '/session/destroy' do 
	session[:user_id] = nil
	redirect to '/'
end


