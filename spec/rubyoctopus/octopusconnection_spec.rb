# frozen_string_literal: true

TEST_URL = "http://www.example.com"
TEST_API_KEY = "API-FAKEAPIKEY"
TEST_PATH = "Environments"
PARAM_TEST_PATH = "param-test"

RSpec.describe RubyOctopus::OctopusConnection do
  before(:each) do
    # Set up Faraday mock
    @faraday = Faraday.new do |builder|
      builder.adapter :test do |stub|
        stub.get("/Environments") do |_env|
          [
            200,
            { "Content-Type": "text/plain" },
            "shrimp"
          ]
        end

        stub.get("/param-test?key=value") do |_env|
          [
            200,
            {},
            "Param test response body"
          ]
        end
      end
    end
    allow(@faraday).to receive(:adapter).with(Faraday.default_adapter)
    allow(@faraday).to receive(:response).with(:json)
    allow(Faraday).to receive(:new).and_yield(@faraday).and_return(@faraday)

    # Create test instance
    @conn = RubyOctopus::OctopusConnection.new(TEST_URL, TEST_API_KEY)
  end

  it "has the correct URL" do
    expect(@conn.url).to eq(TEST_URL)
  end

  it "gets the correct path" do
    response = @conn.get(TEST_PATH)

    # Assert response matches mock
    expect(response.status).to be 200
  end

  it "gets the correct params" do
    response = @conn.get(PARAM_TEST_PATH, { "key" => "value" })
    expect(response.body).to be "Param test response body"
  end
end
