# Requires things from vendor/bundle instead of global PATH
require 'bundler/setup'

# Require the things!
require 'sinatra'

# On '/' page, do this...
get '/' do
  erb :index
end

# On '/search', do this...
get '/search' do
  erb :result
end
