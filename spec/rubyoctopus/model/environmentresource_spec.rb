# frozen_string_literal: true

TEST_ATTRIBUTES = { "Id" => "TEST_ID",
                    "SpaceId" => "TEST_SPACE_ID",
                    "Name" => "TEST_NAME",
                    "Description" => "TEST_DESCRIPTION",
                    "SortOrder" => 0,
                    "UseGuidedFailure" => false,
                    "AllowDynamicInfrastructure" => false,
                    "ExtensionSettings" => { "TEST_SETTING" => "TEST_VALUE" }.freeze,
                    "Links" => { "TEST_LINK" => "TEST_PATH" }.freeze }.freeze

RSpec.describe RubyOctopus::Model::EnvironmentResource do
  it "has properties set after initialization" do
    # Call constructor
    environment = RubyOctopus::Model::EnvironmentResource.new(TEST_ATTRIBUTES)

    # Assertions
    expect(environment.id).to be TEST_ATTRIBUTES["Id"]
    expect(environment.space_id).to be TEST_ATTRIBUTES["SpaceId"]
    expect(environment.name).to be TEST_ATTRIBUTES["Name"]
    expect(environment.description).to be TEST_ATTRIBUTES["Description"]
    expect(environment.sort_order).to be TEST_ATTRIBUTES["SortOrder"]
    expect(environment.use_guided_failure).to be TEST_ATTRIBUTES["UseGuidedFailure"]
    expect(environment.allow_dynamic_infrastructure).to be TEST_ATTRIBUTES["AllowDynamicInfrastructure"]
    expect(environment.extension_settings).to be TEST_ATTRIBUTES["ExtensionSettings"]
    expect(environment.links).to be TEST_ATTRIBUTES["Links"]
  end
end
