# Requires things from vendor/bundle instead of global PATH
require 'bundler/setup'

# Require the things!
require 'git-trend'
require 'sinatra'
require 'sinatra/cookies'

# On '/' page, do this...
get '/' do
  # Gets all trending repos and languages from GitHub,
  # while getting selected language and time from the cookies (if set).
  @all_trending = GitTrend.get(language: cookies[:lang], since: cookies[:time])
  @languages = GitTrend.languages

  # Render index page
  erb :index
end
