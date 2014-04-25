source 'http://ruby.taobao.org'

gem 'rails', '4.0.4'

gem 'sqlite3', :group => [:development, :test]
gem 'pg', :group => :production
gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

gem 'turbolinks'

gem 'mini_magick'
gem 'carrierwave'
gem 'spreadsheet'
#gem "resque", "~> 2.0.0.pre.1", github: "resque/resque"
gem 'resque'

gem 'http_accept_language'

gem 'jbuilder', '~> 1.2'

gem 'flat-ui-sass', github: 'wingrunr21/flat-ui-sass'

gem 'mobile-fu', '~> 1.3.1'

gem 'sitemap_generator'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development do
  gem 'capistrano', '~> 2.15'
  gem 'rvm-capistrano'
  gem 'pry-rails'
end

gem "rack-noie", :require => "noie"

group :production do
  gem 'unicorn'
end

# Use debugger
# gem 'debugger', group: [:development, :test]
