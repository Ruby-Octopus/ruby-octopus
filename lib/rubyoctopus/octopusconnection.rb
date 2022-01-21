# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module RubyOctopus
  # Base class to use to perform actions against an Octopus instance.
  class OctopusConnection
    # Users might want to check which domain an instance is targeting.
    attr_reader :url

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

    def get(resource_type)
      @conn.get(resource_type)
    end
  end
end
