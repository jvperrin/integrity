require File.expand_path("../init", __FILE__)
if (ENV['ADMIN_USERNAME'] || ENV['ADMIN_USER']) && ENV['ADMIN_PASSWORD']
  use Rack::Auth::Basic do |username, password|
    username == (ENV['ADMIN_USERNAME'] || ENV['ADMIN_USER']) && password == ENV['ADMIN_PASSWORD']
  end
end

# puts "Delayed Job Starting..."

# jobs_worker = fork do
#   exec "bundle exec rake jobs:work"
# end

# Process.detach(jobs_worker)
# puts "Delayed Job Started!"

map ('/integrity') { run Integrity.app }
