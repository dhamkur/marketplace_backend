source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.6"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'shrine', '~> 3.5'
gem 'seedbank', '~> 0.5.0'
gem 'faker', '~> 3.2', '>= 3.2.2'
gem 'pagy', '~> 6.2'
gem 'ransack', '3.2.1'
gem 'xendit', '~> 1.0'
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
gem 'country_select', '~> 8.0'
gem 'rack-attack', '~> 6.7'
gem 'ahoy_matey', '~> 5.0', '>= 5.0.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'annotate', '~> 3.2'
end

group :development do
  gem "web-console"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem 'spring'
  gem 'spring-watcher-listen'

  # Deployment
  gem 'capistrano',                   '~> 3.11',  require: false
  gem 'capistrano-rbenv',             '~> 2.1',   require: false
  gem 'capistrano-bundler',                       require: false
  gem 'capistrano-rails',             '~> 1.4',   require: false
  gem 'capistrano3-puma',             '5.2.0',    require: false
  gem 'capistrano-sidekiq',                       require: false
  gem 'capistrano-logtail',           '~> 0.1',   require: false
  gem 'capistrano-rails-console',     '~> 2.3',   require: false
  gem 'capistrano-local-precompile',  '~> 1.2.0', require: false
  gem 'capistrano-faster-assets',     '~> 1.0',   require: false
  gem 'capistrano-rails-collection',  '~> 0.1.0', require: false
  gem "capistrano-anycable",                      require: false

  gem 'listen'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'pry-rails'
  gem 'table_print'
  gem 'awesome_print'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
