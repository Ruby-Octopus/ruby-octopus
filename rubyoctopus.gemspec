# frozen_string_literal: true

require_relative "lib/rubyoctopus/version"

# rubocop:disable Gemspec/RequireMFA
Gem::Specification.new do |spec|
  spec.name = "rubyoctopus"
  spec.version = RubyOctopus::VERSION
  spec.authors = ["Mason Emery", "Jeff Merckens"]
  spec.email = ["thepolytheist@users.noreply.github.com"]

  spec.summary = "RubyOctopus is a REST client for Octopus Deploy written in Ruby."
  spec.homepage = "https://github.com/Ruby-Octopus/ruby-octopus"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/Ruby-Octopus/ruby-octopus/blob/main/CHANGELOG.md"
  spec.metadata["github_repo"] = "git@github.com:Ruby-Octopus/ruby-octopus.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "faraday", "~> 1.0"
  spec.add_dependency "faraday_middleware", "~> 1.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
# rubocop:enable Gemspec/RequireMFA
