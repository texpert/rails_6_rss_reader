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
gem 'puma', '~> 5.5'
gem 'que', git: 'https://github.com/que-rb/que'
gem 'rails', '~> 6.1'
gem 'sassc-rails'
gem 'shrine-lambda', '0.1.1'
gem 'turbolinks', '~> 5'
gem 'twingly-url'
gem 'webpacker', '>= 6.0.0-rc.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'appmap'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.7'
  gem 'localhost', require: 'localhost/authority'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
