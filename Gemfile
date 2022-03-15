# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.0'

gem 'rails', '~> 7.0.2', '>= 7.0.2.2'

gem 'bootstrap', '~> 5.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootstrap5-kaminari-views'
gem 'kaminari', '~> 1.2'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.1'
  gem 'rubocop', '~> 1.25', require: false
  gem 'rubocop-performance', '~> 1.13', require: false
  gem 'rubocop-rails', '~> 2.13', require: false
  gem 'rubocop-rspec', '~> 2.9', require: false
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '~> 0.21', require: false
end

gem 'rdoc'
