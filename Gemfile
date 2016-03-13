source 'https://rubygems.org'

ruby "2.3.0"

gem 'rails', '4.2.5.1'


#Front end stacks
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'sass-rails', '~> 5.0'
gem 'compass-rails', '~> 2.0.4'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'rails-jquery-autocomplete'
gem 'jquery-ui-rails'
gem 'formtastic', '~> 3.0'
gem 'nested_form_fields'
gem 'kaminari'
gem 'bootstrap-datepicker-rails'

#File upload
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'fog'
gem "figaro"
gem 'mini_magick'

#Database and server stacks
gem 'pg'
gem 'puma'

#Authentication and authorization
gem 'sorcery'
gem 'bcrypt'
gem 'rails_admin', '~> 0.7.0'
gem 'cancancan', '~> 1.10'

#Social Media API Wrapper
gem 'fb_graph2'

#api stuff
gem 'httparty', '~> 0.13.7'

#serializer
gem 'active_model_serializers'

#json-web-token
gem 'jwt'
gem 'angular_rails_csrf'

#rack cors
gem 'rack-cors', :require => 'rack/cors'
gem 'pry'
gem 'better_errors'
gem 'binding_of_caller'
gem 'quiet_assets'
gem 'spring'
gem 'rb-readline'
gem 'rails_layout', '~> 1.0.26'
gem 'slim'

# background jobs
gem 'resque', "~> 1.22.0"


group :production do
  gem 'rails_12factor'
  gem 'heroku-deflater'
end


group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'webmock'
end

gem 'sdoc', '~> 0.4.0', group: :doc

