ruby File.read(".ruby-version").strip

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'aws-sdk-route53', '~> 1.25.0'
gem 'aws-sdk-s3', '~> 1'
gem 'devise', '~> 4.6.2'
gem 'devise_invitable', '~> 2.0.1'
gem 'devise-two-factor'
gem 'httparty', '~> 0.17.0'
gem 'mysql2', '~> 0.5.2'
gem 'notifications-ruby-client', '~> 3.1.0'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'sentry-raven'
gem 'tzinfo-data'
gem 'uk_postcode', '~> 2.1'
gem 'zendesk_api'

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'erb_lint', require: false
  gem 'factory_bot_rails', '~> 5.0'
  gem 'faker'
  gem 'govuk-lint', '~> 3'
  gem 'guard-rspec'
  gem 'nokogiri'
  gem 'rack_session_access'
  gem 'rspec-rails', '~> 3'
  gem 'shoulda-matchers', '~> 4.1'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'timecop', '~> 0.9.1'
  gem 'webmock', '~> 3.6.0'
end

group :development, :test do
  gem 'bullet', '~> 6.0'
  gem 'byebug', '~> 11'
  gem 'listen', '~> 3'
  gem 'pry'
  gem 'rack-mini-profiler', require: false
end
