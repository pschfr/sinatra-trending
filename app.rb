# Requires things from vendor/bundle instead of global PATH
require 'bundler/setup'

# Require the things!
require 'git-trend'
require 'sinatra'
require 'sinatra/cookies'

# This is run on initialization
configure do
  # Gets possible languages from GitHub
  set :languages, GitTrend.languages
end

# On '/' page, do this...
get '/' do
  # Gets the trending repos, based on the time and language set in cookies.
  @all_trending = GitTrend.get(language: cookies[:lang], since: cookies[:time])
  # Render index page
  erb :index
end
