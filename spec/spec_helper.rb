# frozen_string_literal: true

require "simplecov"

SimpleCov.start do
  enable_coverage :branch

  # Can configure various reporting groups based on code area
  add_group "Models", "lib/rubyoctopus/model"

  # Filter out folders
  add_filter "/spec/"
end

# Set coverage configuration; will fail spec if missed
SimpleCov.minimum_coverage line: 90, branch: 80
SimpleCov.minimum_coverage_by_file 70

require "rubyoctopus"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
