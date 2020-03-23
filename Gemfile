# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'feedjira'
gem 'httpx'
gem 'pagy'
gem 'public_suffix', '~> 3.0.1'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.0'
gem 'sassc-rails'
gem 'slim-rails'
gem 'sqlite3', '~> 1.4'
gem 'turbolinks', '~> 5'
gem 'twingly-url'
gem 'webpacker'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw] unless ENV['RM_INFO']
  gem 'rspec-rails', '4.0.0.beta3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.77', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
