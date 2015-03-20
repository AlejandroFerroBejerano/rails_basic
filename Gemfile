source 'https://rubygems.org'
ruby '2.2.1'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.1'
# Serve
gem 'pg', '~> 0.18.1'
gem 'unicorn', '~> 4.8.3'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.2.12'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.1',          group: :doc

# Assets
gem 'haml', '~> 4.0.6'
gem 'slim', '~> 3.0.3'
gem 'jquery-rails', '~> 4.0.3'
gem 'jquery-ui-rails', '~> 5.0.3'

# Authentication
gem 'devise', '~> 3.4.1'

# File attachment
gem 'paperclip', '~> 4.2.1'

# Form helpers
gem 'simple_form', '~> 3.1.0'

# Nested attributes forms
gem 'nested_form', '~> 0.3.2'

# ImageMagick/GraphicsMagick processing
gem 'rmagick', '~> 2.13.4', :require => 'RMagick'

# Will Paginate
gem 'will_paginate', '~> 3.0.7'

# Foreman
#gem 'foreman', '~> 0.67.0'
gem 'foreman', git: 'https://github.com/antob/foreman'

gem 'bootstrap-sass'            , '~> 3.3.4.1'
gem 'compass-rails'             , '~> 2.0.4'
gem 'sass-rails'                , '~> 5.0.1'
gem 'chosen-rails'              , '~> 1.4.1'

group :assets do
  gem 'coffee-rails'              , '~> 4.1.0'
  gem 'uglifier'                  , '>= 2.7.1'
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
  gem 'ZenTest'
  gem 'spork'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'autotest-rails'
  gem 'autotest-fsevent'
end
