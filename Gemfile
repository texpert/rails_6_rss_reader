# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

gem 'bootsnap', '>= 1.8.1', require: false
gem 'feedjira'
gem 'httpx'
gem 'oj'
gem 'pagy'
gem 'pg'
gem 'public_suffix'
gem 'puma', '~> 5.6'
gem 'que', '2.1.0'
gem 'rails', '~> 7.0'
gem 'roda'
gem 'sassc-rails'
gem 'shakapacker', '6.5.1'
gem 'shrine', '~> 2.19.4'
gem 'shrine-aws-lambda'
gem 'turbolinks', '~> 5'
gem 'twingly-url'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'localhost', require: 'localhost/authority'
  gem 'ngrok-wrapper'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
