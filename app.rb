# Requires things from vendor/bundle instead of global PATH
require 'bundler/setup'

# Require the things!
require 'sinatra'
require 'sinatra/contrib'

# On '/' page, do this...
get '/' do
  erb :index
end
