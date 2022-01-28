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

    # Makes a GET request to the given URL with the given query parameters.
    # @param url [String] The URL to be appended on the base URL for the GET request.
    # @param query_parameters [Hash<String, String>] A hash of query parameters for the request.
    def get(url, query_parameters = nil)
      if query_parameters.nil?
        @conn.get(url)
      else
        @conn.get(url, query_parameters)
      end
    end
  end
end
