# frozen_string_literal: true

TEST_URL = "http://www.example.com"
TEST_API_KEY = "API-FAKEAPIKEY"
TEST_PATH = "Environments"

RSpec.describe RubyOctopus::OctopusConnection do
  before(:each) do
    # Set up Faraday mock
    @faraday = double("Faraday")
    allow(@faraday).to receive(:adapter).with(Faraday.default_adapter)
    allow(@faraday).to receive(:response).with(:json)
    allow(Faraday).to receive(:new).and_yield(@faraday).and_return(@faraday)

    # Create test instance
    @conn = RubyOctopus::OctopusConnection.new(TEST_URL, TEST_API_KEY)
  end

  it "has the correct URL" do
    expect(@conn.url).to be TEST_URL
  end

  it "gets the correct path" do
    # Set up response mock
    test_response = double("Response")
    allow(@faraday).to receive(:get).with(TEST_PATH).and_return(test_response)

    response = @conn.get(TEST_PATH)

    # Assert response matches mock
    expect(response).to be test_response
  end
end
