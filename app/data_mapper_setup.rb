require './app/models/message'
require './app/models/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/Chitter_development")

DataMapper.finalize

# DataMapper.auto_upgrade!