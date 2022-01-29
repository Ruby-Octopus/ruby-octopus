# frozen_string_literal: true

require_relative "octopusconnection"
require_relative "model/resourcecollection"

module RubyOctopus
  # Base class to use to perform actions against an Octopus instance.
  class OctopusClient
    attr_reader :connection

    def initialize(url, api_key)
      @connection = OctopusConnection.new(url, api_key)
    end

    def collect_params(path, params)
      return params unless path.include?("?")

      query_string = path.split("?")[1]

      return params if query_string.nil?

      query_string.split("&").each do |param_pair|
        split_pair = param_pair.split("=")
        params[split_pair[0]] = split_pair[1]
      end
      params
    end

    def list(path, item_class, params = {})
      params = collect_params(path, params)
      resp = @connection.get(path.delete_prefix("/api/"), params)
      RubyOctopus::Model::ResourceCollection.new(resp.body, item_class)
    end

    def paginate(path, params, item_class, page_func)
      page = list(path, item_class, params)

      while page_func.call(page) && page.items.length.positive? && page.link?("Page.Next")
        page = list(page.link("Page.Next"), item_class)
      end
    end
  end
end
