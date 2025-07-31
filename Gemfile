source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.5'

# Rails framework
gem 'rails', '~> 7.1.0'
gem 'sprockets-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.0'

# Authentication and security
gem 'bcrypt', '~> 3.1.7'
gem 'jwt', '~> 2.7'

# File upload
gem 'carrierwave', '~> 3.0'
gem 'mini_magick', '~> 4.12'

# API and JSON
gem 'jbuilder', '~> 2.11'
gem 'rack-cors'

# Development and testing
group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 6.0'
  gem 'factory_bot_rails', '~> 6.4'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ] 