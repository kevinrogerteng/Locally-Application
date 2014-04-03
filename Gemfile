source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem "json", "~> 1.8.1"
gem "oauth", "~> 0.4.7"

group :development do
	gem "quiet_assets"
	gem 'pry'
end

gem "pg", "~> 0.17.1"
gem 'rails_12factor', group: :production
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

group :doc do
  gem 'sdoc', require: false
end

gem 'rb-fsevent'

gem 'bcrypt-ruby', '~> 3.1.2'

ruby "2.0.0"

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'rb-fsevent', require: false if RUBY_PLATFORM =~ /darwin/i  
  gem 'guard-rspec' 
  gem 'guard-livereload'
  gem 'dotenv-rails'
end

