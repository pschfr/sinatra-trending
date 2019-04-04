desc 'This task is called by the Heroku cron add-on.'

TRENDING_FILE_PATH = 'tmp/trending.json'.freeze

task :cron do
  # Deletes the trending.json file daily
  File.delete(TRENDING_FILE_PATH) if File.exist?(TRENDING_FILE_PATH)
end
