desc 'This task is called by the Heroku cron add-on.'

TRENDING_FILE_PATH = 'tmp/trending.json'.freeze

task :cron do
  # Deletes the trending.json file daily
  puts "cron job called at #{Time.now}"

  if File.exist?(TRENDING_FILE_PATH)
    puts 'deleting old trending.json file...'
    File.delete(TRENDING_FILE_PATH)
  else
    puts 'no old trending.json found.'
  end
end
