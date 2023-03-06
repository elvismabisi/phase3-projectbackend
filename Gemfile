source "https://rubygems.org"

# Sinatra is a DSL for quickly creating web applications
# https://github.com/sinatra/sinatra
gem "sinatra", "~> 2.1"

# React-Sinatra is a gem that makes it easy to integrate React with Sinatra
gem 'react-sinatra'

# TheRubyRacer and mini_racer are JavaScript runtimes for Ruby that allow us to execute JavaScript code in our app
gem 'execjs'
gem 'mini_racer'

# Sinatra-Cross-Origin is a middleware that handles CORS requests in Sinatra apps
gem 'sinatra-cross_origin'

# Thin is a fast and simple web server
# https://github.com/macournoyer/thin
gem "thin", "~> 1.8"

# Rack-Contrib is a collection of Rack middleware
# https://github.com/rack/rack-contrib
gem "rack-contrib", "~> 2.3"

# Rack-Cors is another middleware that handles CORS requests in Rack-based apps
# https://github.com/cyu/rack-cors
gem "rack-cors", "~> 1.1"

# ActiveRecord is an object-relational mapper (ORM) that lets us interact with databases using Ruby code
# https://guides.rubyonrails.org/active_record_basics.html
gem "activerecord", "~> 6.1"

# Sinatra-ActiveRecord is a gem that provides common Rake tasks for working with Active Record in Sinatra apps
# https://github.com/sinatra-activerecord/sinatra-activerecord
gem "sinatra-activerecord", "~> 2.0"

# Rake is a tool for automating tasks in Ruby
# https://github.com/ruby/rake
gem "rake", "~> 13.0"

# SQLite3 is a lightweight and fast SQL database engine that's easy to use
gem "sqlite3", "~> 1.4"

# Require-All is a simple way to require all files in a directory
gem "require_all", "~> 3.0"

# Puma is a fast and multi-threaded web server
gem 'puma'

# BCrypt is a password-hashing library that helps to securely store passwords in a database
gem 'bcrypt'

# These gems will only be used when we are running the application locally
group :development do
  # Pry is a powerful alternative to IRB for Ruby developers
  gem "pry", "~> 0.14.1"
  
  # Faker is a gem that generates fake data for testing purposes
  gem 'faker'
  
  # Rerun automatically reloads your application when there are changes to your code
  # https://github.com/alexch/rerun
  gem "rerun"
end

# These gems will only be used when we are running tests
group :test do
  # DatabaseCleaner is a gem that helps to clean up your test database between tests
  gem "database_cleaner", "~> 2.0"
  
  # Rack-Test is a small testing tool for Rack-based web applications
  # https://github.com/rack/rack-test
  gem "rack-test", "~> 1.1"
  
  # RSpec is a testing framework for Ruby
  gem "rspec", "~> 3.10"
  
  # RSpec-JSON-Expectations is a gem that adds JSON matching to RSpec
  gem "rspec-json_expectations", "~> 2.2"
end
