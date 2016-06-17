source "https://rubygems.org"

ruby "2.3.0"

gem "administrate", "~> 0.2.0"
gem "administrate-field-image"
gem "administrate-field-nested_has_many", "~> 0.0.2"
gem "autoprefixer-rails"
gem "bourbon"
gem "clearance", "~> 1.14.0"
gem "delayed_job_active_record"
gem "faker", "~> 1.6.3"
gem "flutie"
gem "high_voltage"
gem "honeybadger"
gem "jquery-rails"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 4.2.0"
gem "rails-erd"
gem "recipient_interceptor"
gem 'rubocop', require: false
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "scenic"
gem "sprockets", ">= 3.0.0"
gem "sprockets-es6"
gem "title"
gem "uglifier"

group :development do
  gem "quiet_assets"
  gem "refills"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4.0"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
  gem "rails_12factor" 
end
