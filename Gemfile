source 'http://rubygems.org'

gem 'data_mapper',       '~> 1.2'
gem 'dm-sqlite-adapter'
gem 'do_sqlite3'

# Workaround until https://github.com/datamapper/dm-core/issues/242
# is fixed in a released version of datamapper.
gem 'dm-core',
  git: 'git://github.com/datamapper/dm-core',
  branch: 'release-1.2'

gem 'haml'
gem 'sass'

gem 'chronic_duration'
gem 'sinatra'
gem 'sinatra-authorization'

gem 'bcat'
gem 'rake'

gem 'em-eventsource', '~> 0.1.8'

gem 'pry'

# If you want to use Thin:
gem 'thin'

# Foreman
gem 'foreman', '~> 0.63.0'

# If you want to use Unicorn:
# gem 'unicorn'

# These are dependencies for the various notifiers. Uncomment as appropriate.
# = Email
# gem 'pony', '1.1'

# = SES Email
# gem 'aws-ses', '0.4.3', require: 'aws/ses'

# = Campfire
# gem 'broach', '0.2.1'
# gem 'nap', '0.4'

# = AMQP
# gem 'bunny', '0.6.0'

# = IRC
# gem 'shout-bot', '0.0.7'

# = Dependencies for the :dj builder
gem 'sqlite3-ruby', '1.3.2'
gem 'activerecord', '3.0.3'
gem 'delayed_job', '3.0.5'
# If running on ruby 1.9 with psych:
# https://github.com/collectiveidea/delayed_job/issues/199
# gem 'delayed_job', '3.0.0'
# gem 'delayed_job_active_record', '0.3.1'

# = Dependency for the :resque builder
# gem 'resque', '1.10.0'

# Uncomment if you're using pg or mysql instead of sqlite
# gem 'pg'
# gem 'dm-postgres-adapter', '~> 1.2.0'
# If installing dependencies with rpg:
# gem 'do_postgres', '0.10.2'

# gem 'mysql'
# gem 'dm-mysql-adapter', '1.0.2'

# mini profiler
gem 'rack-mini-profiler', '~> 0.9.0'

# = Development dependencies.
group :test do
  gem 'aws-ses', require: 'aws/ses'
  gem 'extlib'
  gem 'sqlite3'
  # gem 'delayed_job'
  gem 'delayed_job_active_record'
  # gem 'activerecord',    '~> 3.2'
  gem 'i18n'
  gem 'rr'
  gem 'mocha'
  gem 'redgreen'
  gem 'dm-sweatshop',
    git: 'git://github.com/p/dm-sweatshop-without-parsetree',
    branch: 'integrity'
  gem 'randexp'
  gem 'pony'
  gem 'rack-test'
  gem 'nokogiri'
  gem 'hpricot'
  gem 'contest'
  gem 'webrat'
  gem 'broach'
  gem 'nap'
  gem 'bunny'
  gem 'shout-bot'
  gem 'webmock'
  gem 'turn'
  gem 'timecop'
end
