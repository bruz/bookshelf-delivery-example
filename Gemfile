source 'https://rubygems.org'

gem 'bundler'
gem 'rake'
gem 'hanami',       '~> 0.8'
gem 'hanami-model', '~> 0.6'
gem 'pg'

# API
gem 'roar'
gem 'multi_json'

# CLI
gem 'thor'

group :development do
  # Code reloading
  gem 'shotgun'

  # Static code analysis
  gem 'rubocop'
end

group :test, :development do
  # Config from .env files
  gem 'dotenv', '~> 2.0'

  # Debugging
  gem 'byebug'
  gem 'pry'
end

group :test do
  gem 'minitest'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
