$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))

begin
  require ".bundle/environment"
rescue LoadError
  require "bundler/setup"
end

require "integrity"

# Uncomment as appropriate for the notifier you want to use
# = Email
# require "integrity/notifier/email" # https://github.com/benprew/pony
# = SES Email
# require "integrity/notifier/ses"
# = Campfire
# require "integrity/notifier/campfire"
# = Flowdock
# require "integrity/notifier/flowdock"
# = TCP
# require "integrity/notifier/tcp"
# = HTTP
# require "integrity/notifier/http"
# = AMQP
# require "integrity/notifier/amqp"
# = Shell
# require "integrity/notifier/shell"
# = Co-op
# require "integrity/notifier/coop"
# = IRC
# require "integrity/notifier/irc"

Integrity.configure do |c|
  # DataMapper database connection URI
  c.database                    = "sqlite3:db/integrity.db"
  # PostgreSQL via the local socket to "integrity" database:
  # c.database                  = "postgres:///integrity"
  # PostgreSQL via a more full specification:
  # c.database                  = "postgres://user:pass@host:port/database"
  # On Heroku:
  # c.database                  = ENV['DATABASE_URL']

  # Parent directory for builds, relative to Integrity root
  c.directory                   = "builds"
  # If running on Heroku:
  # c.directory                 = File.dirname(__FILE__) + '/tmp/builds'

  # URL to the root of Integrity installation, used in notification emails:
  c.base_url                    = "http://ci.example.org"

  # Where to write the log file.
  # If running on Heroku, comment out c.log
  c.log                         = "integrity.log"

  # Enable GitHub post-receive hook
  c.github_token                = "d2ded986a43f012286206a0190829e97b531cb4423e7e82a598fda771b0be750"

  # If true, build all commits. If false, only build HEAD after each push
  c.build_all                   = false

  # Automatically create projects for newly pushed branches
  c.auto_branch                 = true

  # When auto_branch is enabled, automatically delete projects when
  # their corresponding branches are deleted
  c.trim_branches               = false

  # Which builder to use. Please refer to the documentation for the list
  # of builders and their limitations
  c.builder                     = :dj, { adapter: "sqlite3", database: "db/integrity.db" }

  # How many builds to show by default on project pages
  c.project_default_build_count = 20

  # How often to collect build output from running builds
  c.build_output_interval       = 1

  # Make status badge public for all projects? Otherwise, login is
  # required to see status badge for private projects.
  c.status_image_always_public  = true

  # Use https://github.com/grahamc/git-cachecow to cache repository locally
  # c.checkout_proc             = Proc.new do |runner, repo_uri, branch, sha1, target_directory|
  #   runner.run! "git scclone #{repo_uri} #{target_directory} #{sha1}"
  # end
end
