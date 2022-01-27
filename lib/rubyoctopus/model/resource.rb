# frozen_string_literal: true

module RubyOctopus
  module Model
    # The base resource class containing standard properties.
    class Resource
      attr_accessor :id, :last_modified_on, :last_modified_by, :links

      def initialize(attribute_values = {})
        @id = attribute_values["Id"]
        @last_modified_on = attribute_values["LastModifiedOn"]
        @last_modified_by = attribute_values["LastModifiedBy"]
        @links = attribute_values["Links"]
      end

      # @param [String] name
      # @return [bool]
      def link?(name)
        !@links.nil? && @links.key?(name)
      end

      # @param [String] name
      # @return [String]
      def link(name)
        raise KeyError.new("Link not found with name #{name}.", key: name) unless link?(name)

        @links[name]
      end
    end
  end
end
