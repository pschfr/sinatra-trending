# Requires gems from vendor/bundle instead of global PATH
require 'bundler/setup'

# Require the gems used in this file
require 'oj'
require 'git-trend'
require 'sinatra'
require 'sinatra/cookies'

# My constants
TRENDING_TMP_DIR = 'tmp/'.freeze
TRENDING_TMP_FILE = 'trending.json'.freeze
TRENDING_TMP_PATH = File.join(TRENDING_TMP_DIR, TRENDING_TMP_FILE).freeze

# This is run on Sinatra initialization
configure do
  # Gets all possible languages from GitHub
  set :languages, GitTrend.languages
end

# On '/' page, do this...
get '/' do
  # If trending repo temp file exists, use it.
  if File.exist?(TRENDING_TMP_PATH)
    # Open and parse JSON
    @trending = Oj.load(File.open(TRENDING_TMP_PATH, 'rb').read)
  else
    # Otherwise, attempt to make the request while protecting Sinatra from
    # receiving an Exception instead of data.
    begin
      # Gets the trending repos, based on the time and language set in cookies.
      @trending = GitTrend.get(language: cookies[:lang], since: cookies[:time])

      # Creates the temp directory if it doesn't exist
      Dir.mkdir(TRENDING_TMP_DIR) unless File.directory?(TRENDING_TMP_DIR)

      # Save trending repos to local temp cache file
      File.write(TRENDING_TMP_PATH, Oj.dump(@trending))
    rescue StandardError
      # Otherwise, send nothing.
      @trending = nil
    end
  end

  # Either way at this point the file exists, so return the last modified time.
  @updated = File.mtime(TRENDING_TMP_PATH)

  # Render index page
  erb :index
end
