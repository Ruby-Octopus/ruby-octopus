# frozen_string_literal: true

require "dotenv/load"

require_relative "../lib/rubyoctopus"

# Set these values in your .env
client = RubyOctopus::OctopusClient.new(ENV["OCTOPUS_URL"], ENV["OCTOPUS_API_KEY"])

# Gets the first page of environments from the server
response = client.connection.get("Environments")
puts "Received a #{response.status} response from server"

environments = if response.status == 200
                 RubyOctopus::Model::ResourceCollection.new(response.body,
                                                            RubyOctopus::Model::EnvironmentResource).items
               end

environments.each { |environment| puts "#{environment.id}: #{environment.name}" }
