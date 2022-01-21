# frozen_string_literal: true

module RubyOctopus
  # A class modeling an Environment in Octopus.
  class EnvironmentResource
    attr_accessor :id, :space_id, :name, :description, :sort_order, :use_guided_failure, :allow_dynamic_infrastructure,
                  :extension_settings, :links

    def initialize(attribute_values)
      @id = attribute_values["Id"]
      @space_id = attribute_values["SpaceId"]
      @name = attribute_values["Name"]
      @description = attribute_values["Description"]
      @sort_order = attribute_values["SortOrder"]
      @use_guided_failure = attribute_values["UseGuidedFailure"]
      @allow_dynamic_infrastructure = attribute_values["AllowDynamicInfrastructure"]
      @extension_settings = attribute_values["ExtensionSettings"]
      @links = attribute_values["Links"]
    end
  end
end
