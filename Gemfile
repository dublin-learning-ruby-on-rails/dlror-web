source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'carrierwave'
gem 'mini_magick'
gem 'devise'
gem 'cancancan', '~> 1.10'
gem 'omniauth-meetup'
gem 'rMeetup'
gem 'rufus-scheduler'

gem 'foundation-rails'
gem 'redactor-rails'
gem 'simple_form'
gem 'font-awesome-sass'
gem 'meta-tags'

gem 'puma'

gem 'ahoy_matey'

gem 'validate_url'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.4'
  gem 'rspec-collection_matchers'
  gem 'faker'
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'guard-rspec', require: false

  gem 'webmock', require: false

  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', '~> 2.0', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  # gem 'capistrano3-nginx', '~> 2.0'
end

group :test do
  gem 'database_cleaner'
  gem 'rake'
end
