require 'sinatra'
require 'data_mapper'
require_relative 'models/user'
require_relative 'models/message'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'



enable :sessions
set :session_secret, "secret"

get '/' do 
	@messages = Message.all
	erb :index
end

get '/users/new' do 
	erb :"users/new"
end

post '/users' do 
	user = User.create(:name => params[:name],
							:email => params[:email],
							:password => params[:password],
							:password_confirmation => params[:password_confirmation])
	session[:user_id] = user.id
	redirect to('/')
end
