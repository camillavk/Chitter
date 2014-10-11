require 'sinatra'
require 'data_mapper'
env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/Chitter_#{env}")

  require './app/models/message'

  DataMapper.finalize

  DataMapper.auto_upgrade!

  # start the server if ruby file executed directly
get '/' do 
	erb :index
end
