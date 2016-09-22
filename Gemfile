source 'https://rubygems.org'

gem 'bundler'
gem 'rake'
gem 'hanami',       '~> 0.8'
gem 'hanami-model', '~> 0.6'
gem 'pg'

# Needed until new versions are available for all the dry-* gems
gem 'dry-struct',     require: false, github: 'dry-rb/dry-struct'
gem 'dry-types',      require: false, github: 'dry-rb/dry-types'
gem 'dry-validation', require: false, github: 'dry-rb/dry-validation'

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
