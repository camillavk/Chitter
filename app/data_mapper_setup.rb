require './app/models/message'
require './app/models/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://zcebxyfqjphtcz:qJaf2sCOs87hDMCw5thNJEw2Zl@ec2-54-83-204-104.compute-1.amazonaws.com:5432/dftbg7cb6ffn39")

DataMapper.finalize

# DataMapper.auto_upgrade!