# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: '.tool-versions'

gem 'bootsnap', '>= 1.8.1', require: false
gem 'feedjira'
gem 'httpx'
gem 'oj'
gem 'pagy'
gem 'pg'
gem 'public_suffix'
gem 'puma', '~> 6.5'
gem 'que', '>= 2.3.0'
gem 'rails', '~> 8.0'
gem 'rails-html-sanitizer', '>= 1.6.1'
gem 'roda'
gem 'sassc-rails'
gem 'shakapacker', '8.1.0'
gem 'shrine', '~> 3.6'
gem 'shrine-aws-lambda', '~> 0.2.1'
gem 'turbolinks', '~> 5'
gem 'twingly-url'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'dotenv'
  gem 'pg_query'
  gem 'prosopite'
  # It needs to be in both groups to expose generators and rake tasks without having to type RAILS_ENV=test
  gem 'rspec-rails', '~> 7.1'
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', require: false
end

group :development do
  gem 'localhost', require: 'localhost/authority'
  gem 'ngrok-wrapper'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
