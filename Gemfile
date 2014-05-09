source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Serve
gem 'pg', '~> 0.17.1'
gem 'unicorn', '~> 4.8.3'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Assets
gem 'haml', '~> 4.0.5'
gem 'jquery-rails', '~> 3.1.0'

# Authentication
gem 'devise', '~> 3.2.4'

# File attachment
gem 'paperclip', '~> 4.1.1'

# Form helpers
gem 'simple_form', '~> 3.0.2'

# Nested attributes forms
gem 'nested_form', '~> 0.3.2'

# ImageMagick/GraphicsMagick processing
gem 'rmagick', '~> 2.13.2', :require => 'RMagick'

# Foreman
# gem 'foreman', '~> 0.67.0'

gem 'bootstrap-sass'            , '~> 3.1.1.1'
gem 'compass-rails'             , '~> 1.1.7'
gem 'sass-rails'                , '~> 4.0.3'

group :assets do
  gem 'coffee-rails'              , '~> 4.0.1'
  gem 'uglifier'                  , '>= 1.3.0'
end

group :development do
  gem 'quiet_assets'
  gem 'hirb'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "erb2haml"
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'spork'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'autotest-rails'
  gem 'autotest-fsevent'
end
