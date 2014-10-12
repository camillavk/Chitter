require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require_relative 'models/user'
require_relative 'models/message'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/messages'


enable :sessions
set :session_secret, "secret"
use Rack::Flash



