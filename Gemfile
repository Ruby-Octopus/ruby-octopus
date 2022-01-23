# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in rubyoctopus.gemspec
gemspec

# rubocop:disable Style/HashSyntax
gem "rubocop", "~> 1.21", :group => %i[development test]
# rubocop:enable Style/HashSyntax

group :development do
  gem "dotenv"
end

group :test do
  gem "simplecov", require: false

  gem "rake", "~> 13.0"

  gem "rspec", "~> 3.0"
end
