# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new do |t|
  t.options = ["--auto-correct-all"]
end

RuboCop::RakeTask.new("rubocop:staged") do |t|
  staged_ruby_files = `git diff --cached --name-only | grep -E '\.rb$'`
  t.patterns = staged_ruby_files.split()
end

task default: %i[spec rubocop]
