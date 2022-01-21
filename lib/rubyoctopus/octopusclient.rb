# frozen_string_literal: true

require_relative "octopusconnection"
require_relative "environmentresource"

module RubyOctopus
  # Base class to use to perform actions against an Octopus instance.
  class OctopusClient
    attr_reader :connection

    def initialize(url, api_key)
      @connection = OctopusConnection.new(url, api_key)
    end

    # Requests the first page of Environments
    # @return [Array<EnvironmentResource>, nil] A list of Environments or nothing.
    def some_environments
      resp = @connection.get("Environments")
      resp.body["Items"].map { |item| EnvironmentResource.new(item) } if resp.status == 200
    end
  end
end
