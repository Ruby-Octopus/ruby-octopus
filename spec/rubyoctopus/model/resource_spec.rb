# frozen_string_literal: true

TEST_LINK_KEY = "Link.Key"
TEST_LINK_VALUE = "Link.Value"
TEST_MISSING_LINK_KEY = "Link.MissingKey"
TEST_LINK_COLLECTION = { "Link.Key" => TEST_LINK_VALUE }.freeze

RSpec.describe RubyOctopus::Model::Resource do
  it "returns has_link? false when links hasn't been initialized" do
    resource = RubyOctopus::Model::Resource.new
    has_link = resource.link?(TEST_LINK_KEY)
    expect(has_link).to be false
  end

  it "returns has_link? false when key isn't present" do
    resource = RubyOctopus::Model::Resource.new({ "Links" => TEST_LINK_COLLECTION })
    has_link = resource.link?(TEST_MISSING_LINK_KEY)
    expect(has_link).to be false
  end

  it "returns has_link? true when key is present" do
    resource = RubyOctopus::Model::Resource.new({ "Links" => TEST_LINK_COLLECTION })
    has_link = resource.link?(TEST_LINK_KEY)
    expect(has_link).to be true
  end

  it "raises KeyError when link key is missing" do
    resource = RubyOctopus::Model::Resource.new({ "Links" => TEST_LINK_COLLECTION })
    expect { resource.link(TEST_MISSING_LINK_KEY) }.to raise_error(KeyError)
  end

  it "returns link value when key is present" do
    resource = RubyOctopus::Model::Resource.new({ "Links" => TEST_LINK_COLLECTION })
    link = resource.link(TEST_LINK_KEY)
    expect(link).to be TEST_LINK_VALUE
  end
end
