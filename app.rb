# Requires things from vendor/bundle instead of global PATH
require 'bundler/setup'

# Require the things!
require 'git-trend'
require 'sinatra'
require 'sprockets'

# On '/' page, do this...
get '/' do
  # Get all trending repos and languages
  @all_trending = GitTrend.get(params['lang'])
  @languages = GitTrend.languages

  # Render index page
  erb :index
end

# On '/search', do this...
get '/search' do
  # Render result page
  erb :result
end
