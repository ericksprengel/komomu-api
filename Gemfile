source 'https://rubygems.org'

gem 'rails', '3.2.7'
gem 'therubyracer'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'rspec-rails', "~> 2.0"
  gem 'sqlite3'
  gem "factory_girl_rails"
  gem 'forgery'
end

group :production do
  gem 'mysql2'
  gem 'activerecord-mysql2-adapter'
  gem 'thin'
end

group :test do
  gem 'capybara', "~> 1.1.2"
  gem "database_cleaner", ">= 0.7.1"
  gem "shoulda"
end

gem 'jquery-rails'
gem 'rabl'
gem 'fb_graph'
gem 'pushmeup'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
