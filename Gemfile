source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'
gem 'activeadmin'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'carrierwave'
gem 'devise'
gem 'draper'
gem 'ffaker'
gem 'file_validators'
gem 'fog-aws'
gem 'haml-rails'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.1'
gem 'pundit'
gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'bullet'
  gem 'listen', '~> 3.2'
  gem 'pry'
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3', '~> 1.4'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
