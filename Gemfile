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

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'annotate', '~> 3.2'
end

group :development do
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
