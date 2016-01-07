require_relative '../models/booking'
#require_relative '../models/answer'
#require 'byebug'

	post '/properties/bookings/:property_id' do
	#byebug
	@bookings = Booking.create(booking: params[:book], user_id: session[:user_id], property_id: params[:property_id])
	#byebug
	redirect to "/properties/bookings/#{params[:property_id]}"
	# redirect to '/properties/bookings/vcvcvc'
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
get '/properties/bookings/:property_id' do
	@properties = Property.find(params[:property_id])
	erb :"static/booking"
end 