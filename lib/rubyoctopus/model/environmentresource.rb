# frozen_string_literal: true

require_relative "resource"

module RubyOctopus
  module Model
    # A class modeling an Environment in Octopus.
    class EnvironmentResource < Resource
      attr_accessor :space_id, :name, :description, :sort_order, :use_guided_failure,
                    :allow_dynamic_infrastructure, :extension_settings

      def initialize(attribute_values = {})
        super
        @space_id = attribute_values["SpaceId"]
        @name = attribute_values["Name"]
        @description = attribute_values["Description"]
        @sort_order = attribute_values["SortOrder"]
        @use_guided_failure = attribute_values["UseGuidedFailure"]
        @allow_dynamic_infrastructure = attribute_values["AllowDynamicInfrastructure"]
        @extension_settings = attribute_values["ExtensionSettings"]
      end
    end
  end
end
