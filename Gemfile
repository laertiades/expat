source 'https://rubygems.org'
ruby '2.1.0'
#ruby-gemset=expat_4_0

gem 'rails', '~> 4.0.2'
gem 'pg', '~> 0.17.1'
gem 'sass-rails', '~> 4.0.1'
# gem 'bootstrap-sass', '2.3.2.0'
gem 'bootstrap-sass', '~> 3.1.0'
gem 'uglifier', '>= 2.4.0'
gem 'coffee-rails', '~> 4.0.1'
# gem 'jquery-rails', '~> 3.0.4'
gem 'jquery-rails'
# gem 'jquery-ui-rails'
gem 'turbolinks', '~> 2.2.0'
gem 'jbuilder', '~> 1.5.3'
gem 'metamagic', '~> 2.0.6'
gem 'nokogiri', '~> 1.6.0'

gem 'comfortable_mexican_sofa', :git => 'git://github.com/laertiades/comfortable-mexican-sofa.git'
# gem 'comfortable_mexican_sofa', '~> 1.11.0'
# gem 'comfortable_mexican_sofa', '~> 1.11.0', :git => 'git://github.com/laertiades/comfortable-mexican-sofa.git'
# gem 'comfortable_mexican_sofa', '~> 1.11.0', :path => '/home/jesse/rails/comfortable-mexican-sofa'

# gem 'simple_captcha', :git => 'git://github.com/pludoni/simple-captcha.git'
# gem 'simple_captcha', :git => 'git://github.com/galetahub/simple-captcha.git'
gem 'simple_captcha', :git => 'git://github.com/laertiades/simple-captcha.git'

gem 'mobvious'
gem 'aws-sdk'
gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git'
# gem 'will_paginate'
gem 'rack-cache', :git => 'git://github.com/laertiades/rack-cache.git'
gem 'rack-cache-purge', :git => 'git://github.com/laertiades/rack-cache-purge.git'
gem 'dalli'
gem 'kgio'
gem "memcachier"
gem 'unicorn'
gem "rack-timeout"
gem 'rack-rewrite'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'heroku_rails_deflate'
end

group :development, :test do
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
end

group :test do
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'capybara', '2.1.0'
  gem 'libnotify', '0.8.0'
  gem 'factory_girl_rails', '4.2.1'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end
