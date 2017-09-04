source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
#server
gem 'puma',     '3.4.0'
#css precompile
gem 'sass-rails', '~> 5.0'
#ES6 minifying
gem 'uglifier', '>= 1.3.0'

#fine js style as ruby
gem 'coffee-rails', '~> 4.2'
#UI JQuery
gem 'jquery-rails'
#UI selecter
gem "select2-rails"

gem 'turbolinks', '~> 5'

# gem 'jbuilder', '~> 2.5' #no need if use active_model_serializers
# JSON `views` for API
gem 'active_model_serializers', '~> 0.10.0'
#autorize
gem 'devise', '~> 4.2.1'
#css
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
#for upload files #use one of
gem 'paperclip', '~> 5.1'
gem 'carrierwave', '~> 1.0'
gem 'aws-sdk'
#crop img
gem 'mini_magick'
gem 'rmagick', '~> 2.16'
# social
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem "omniauth-google-oauth2"
# fine forms helpers
gem 'simple_form', '~> 3.4' #no need if use react
gem 'figaro'
gem 'inky-rb', require: 'inky'
# Stylesheet inlining for email
gem 'premailer-rails'
gem 'foundation_emails'

# if you use builder for HTML
gem 'haml', '~> 5.0'

gem 'masonry-rails', '~> 0.2.4'
gem 'jquery-turbolinks', '~> 2.1'
gem 'acts-as-taggable-on'
gem 'will_paginate'

gem 'pg', '0.18.4'

#test data
gem 'faker', '~> 1.6', '>= 1.6.3'

#Use REACT
gem 'react_on_rails', '~>7'

gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'awesome_print'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  #debuging
  gem 'pry-rails'
  gem 'pry'
end


group :test do
  gem 'capybara', '>= 2.5.0'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'factory_girl_rails', '~> 4.8.0'

  gem 'launchy', '~> 2.4', '>= 2.4.3'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'mini_racer', platforms: :ruby
