# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

require_relative "environmentresource"

module RubyOctopus
  # Base class to use to perform actions against an Octopus instance.
  class OctopusClient
    # Users might want to check which domain an instance is targeting.
    attr_reader :url

    # No need to expose the connection object.
    @conn = nil

    def initialize(url, api_key)
      @url = url
      @conn = Faraday.new(
        url: url,
        headers: { "X-Octopus-ApiKey": api_key }
      ) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.response :json
      end
    end

    # Requests the first page of Environments
    # @return [Array<EnvironmentResource>, nil] A list of Environments or nothing.
    def some_environments
      resp = @conn.get("Environments")
      resp.body["Items"].map { |item| EnvironmentResource.new(item) } if resp.status == 200
    end
  end
end
