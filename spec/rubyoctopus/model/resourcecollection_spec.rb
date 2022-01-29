# frozen_string_literal: true

RSpec.describe RubyOctopus::Model::ResourceCollection do
  it "raises error when Items is nil" do
    attribute_values = { "Links" => {} }
    expect { RubyOctopus::Model::ResourceCollection.new(attribute_values, double) }.to raise_error(ArgumentError)
  end

  it "raises error when Links is nil" do
    attribute_values = { "Items" => {} }
    expect { RubyOctopus::Model::ResourceCollection.new(attribute_values, double) }.to raise_error(ArgumentError)
  end

  it "initializes when arguments are correct" do
    attribute_values = { "Items" => {}, "Links" => {} }
    RubyOctopus::Model::ResourceCollection.new(attribute_values, double)
  end
end
