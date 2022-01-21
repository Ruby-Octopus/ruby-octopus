# frozen_string_literal: true

require_relative "octopusconnection"

module RubyOctopus
  # Base class to use to perform actions against an Octopus instance.
  class OctopusClient
    attr_reader :connection

    def initialize(url, api_key)
      @connection = OctopusConnection.new(url, api_key)
    end
  end
end
