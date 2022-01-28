# frozen_string_literal: true

require "dotenv/load"

require_relative "../lib/rubyoctopus"

# Set these values in your .env
client = RubyOctopus::OctopusClient.new(ENV["OCTOPUS_URL"], ENV["OCTOPUS_API_KEY"])

environments = []

client.paginate("Environments", { "take" => 1 }, RubyOctopus::Model::EnvironmentResource, lambda do |page|
  environments.concat(page.items)
  true
end)

environments.each { |environment| puts "#{environment.id}: #{environment.name}" }
