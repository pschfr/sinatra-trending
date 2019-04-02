# Requires things from vendor/bundle instead of global PATH
require 'bundler/setup'

# Require the things!
require 'oj'
require 'git-trend'
require 'sinatra'
require 'sinatra/cookies'

# My constants
TRENDING_TMP_DIR = 'tmp/'.freeze
TRENDING_TMP_FILE = 'trending.json'.freeze
TRENDING_TMP_PATH = File.join(TRENDING_TMP_DIR, TRENDING_TMP_FILE).freeze

# This is run on initialization
configure do
  # Gets possible languages from GitHub
  set :languages, GitTrend.languages
end

# On '/' page, do this...
get '/' do
  # if file exists, use it.
  if File.exist?(TRENDING_TMP_PATH)
    # Open and parse JSON
    @trending = Oj.load(File.open(TRENDING_TMP_PATH, 'rb').read)
  else
    # Otherwise, attempt to make request.
    # Attempts to protect Sinatra from reciving an Exception instead of data.
    begin
      # Gets the trending repos, based on the time and language set in cookies.
      @trending = GitTrend.get(language: cookies[:lang], since: cookies[:time])
      # Create temp directory if it doesn't exist
      Dir.mkdir(TRENDING_TMP_DIR) unless File.directory?(TRENDING_TMP_DIR)
      # Attempt to write to local temp cache file
      File.write(TRENDING_TMP_PATH, Oj.dump(@trending))
    rescue StandardError
      # Otherwise, send nothing.
      @trending = nil
    end
  end

  # Render index page
  erb :index
end
