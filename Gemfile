source 'http://rubygems.org'

gem 'rails', '~>3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#database
gem 'sqlite3', :group => :development
gem 'pg', :group => :produciton

#server push
#gem 'faye'

#haml
gem 'haml-rails'
gem 'coffee-filter'

#DSL for forms and show
gem 'simple_form'
gem 'show_for'
gem 'ransack'

#image uploads
gem 'carrierwave'
#gem 'image_science'

#user registration and role management
gem 'authlogic'
gem 'cancan'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

#for now it's general use due to heroku, but it should be in test-dev
gem 'ffaker'

group :development do
  gem 'pry'
  gem 'pry-doc'
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'capybara'
end
