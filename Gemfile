source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.0.8'  # Update to latest 7.0.x
gem 'pg', '~> 1.5.4'  # Latest version with better Windows support
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '>= 1.3.0'
gem 'jsbundling-rails', '~> 1.3', '>= 1.3.1'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Update these gems for Rails 7 compatibility
gem 'jquery-rails', '~> 4.6.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11'
gem 'sdoc', '~> 2.6', group: :doc

gem 'rails_admin', '~> 3.1.0'  # Update to version compatible with Rails 7
gem 'sequenced'
gem 'dragonfly', '~> 1.0.12'
gem 'dragonfly-s3_data_store'
gem 'image_size'

# Adding rack attach to whitelist IP
gem 'rack-attack'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Windows dependencies and image processing
platforms :mswin, :mingw, :x64_mingw do
  # Windows-specific gems only
  gem 'windows-pr'
  gem 'win32-process'
end

# Ensure compatibility with different platforms
platforms :ruby, :x64_mingw_ucrt, :x86_64_linux do
  # Platform-specific gems can go here
end

# Use mini_magick for all platforms (including Windows)
gem 'mini_magick', '~> 4.12.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rest-client'
  gem 'rspec-rails', '~> 6.0'  # Update to latest version
  gem "factory_girl_rails", "~> 4.9.0"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 4.2'
  gem 'spring'
end

group :test do
  gem 'cucumber-rails', '~> 3.0', require: false
  gem 'database_cleaner'
  gem 'poltergeist', '~> 1.18'
end

group :demo_test_run do
  gem 'capybara', '~> 3.39'  # Update to latest version
  gem 'rspec'
  gem 'spectre_client', git: 'https://github.com/wearefriday/spectre_client.git'
end

gem 'nokogiri', '~> 1.15.4'  # Update to latest 1.15.x

# No changes to the Gemfile itself, but run the following command:
# 
# $ bundle update --bundler
# 
# This will regenerate the Gemfile.lock with Bundler 2.6.6.
