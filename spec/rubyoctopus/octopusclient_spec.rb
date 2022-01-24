# frozen_string_literal: true

TEST_URL = "http://www.example.com"
TEST_API_KEY = "API-FAKEAPIKEY"

RSpec.describe RubyOctopus::OctopusClient do
  it "has a connection after initialization" do
    # Set up connection mock
    connection = double("Connection")
    allow(RubyOctopus::OctopusConnection).to receive(:new).with(TEST_URL, TEST_API_KEY).and_return(connection)

    # Call constructor
    client = RubyOctopus::OctopusClient.new(TEST_URL, TEST_API_KEY)

    # Assertions
    expect(client.connection).not_to be nil
    expect(client.connection).to be connection
  end
end
