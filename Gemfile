source 'https://rubygems.org'

ruby '2.0.0'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'foreman'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'haml2slim'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'fabrication'
  gem 'rspec-rails'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'turnip', '>= 1.1.0'
end

# For Heroku
group :production do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
  gem 'rack-cache'
end

gem 'cancan'
gem 'rolify'
# gem 'devise'
# gem 'devise_invitable'
gem 'foundation-rails'
gem 'pg'


gem 'simple_form'
gem 'slim-rails'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'refinerycms', github: 'refinery/refinerycms', branch: 'master'
gem 'refinerycms-i18n', github: 'refinery/refinerycms-i18n', branch: 'master'
gem 'refinerycms-settings', github: 'refinery/refinerycms-settings', branch: 'master'
gem 'refinerycms-blog', github: 'refinery/refinerycms-blog', branch: 'master'
gem 'refinerycms-page-images', github: 'refinery/refinerycms-page-images', branch: 'master'

#gem 'refinerycms-calendar', github: 'refinery/refinerycms-calendar', branch: 'master'
gem 'refinerycms-codemirror'

gem 'friendly_id', github: 'norman/friendly_id', branch: 'master'
gem 'friendly_id-globalize', github: 'norman/friendly_id-globalize', branch: 'master'

# Add support for refinerycms-acts-as-indexed
gem 'refinerycms-acts-as-indexed', github: 'refinery/refinerycms-acts-as-indexed'

gem 'seo_meta', github: 'parndt/seo_meta', branch: 'master'

gem 'paper_trail', github: 'airblade/paper_trail', branch: 'master'
gem 'awesome_nested_set', github: 'collectiveidea/awesome_nested_set', branch: 'master'


# Spree commerce
# gem 'spree', github: 'spree/spree', branch: '2-1-stable'
# gem 'spree_gateway', github: 'spree/spree_gateway', branch: '2-1-stable'
# gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '2-1-stable'

#Gem 'refinery_blog_spree_products', :git => 'git://github.com/webjuice/refinery-blog-spree-products.git'
#gem 'spreefinery_core', :git => 'git://github.com/shoponrails/spreefinery_core.git'
#gem 'spree-refinerycms-authentication', :git => 'git://github.com/adrianmacneil/spree-refinery-authentication.git'

gem 'refinerycms-blocks', path: 'vendor/extensions'
#gem 'refinerycms-bricks', path: 'vendor/extensions'
#gem 'refinerycms-blocks', path: 'vendor/extensions'
#gem 'refinerycms-calendar', path: 'vendor/extensions'
