# frozen_string_literal: true

TEST_URL = "http://www.example.com"
TEST_API_KEY = "API-FAKEAPIKEY"
TEST_PATH = "Environments"
TEST_PARAMS = { "key1" => "value1" }.freeze

RSpec.describe RubyOctopus::OctopusClient do
  before(:each) do
    # Set up connection mock
    @connection = double("Connection")
    allow(RubyOctopus::OctopusConnection).to receive(:new).with(TEST_URL, TEST_API_KEY).and_return(@connection)

    # Call constructor
    @client = RubyOctopus::OctopusClient.new(TEST_URL, TEST_API_KEY)
  end

  it "has a connection after initialization" do
    expect(@client.connection).not_to be nil
    expect(@client.connection).to be @connection
  end

  it "returns params when path doesn't have any" do
    params = @client.collect_params("/", { "key1" => "value1" })
    expect(params["key1"]).to be "value1"

    params = @client.collect_params("/?", { "key2" => "value2" })
    expect(params["key2"]).to be "value2"
  end

  it "collects params from both sources" do
    params = @client.collect_params("/?query_key=query_value", { "key3" => "value3" })
    expect(params["query_key"]).to eq("query_value")
    expect(params["key3"]).to be "value3"
  end

  it "returns a ResourceCollection for the right path" do
    clazz = double("Class")
    response = double("Response")
    resource_collection = double("ResourceCollection")
    allow(resource_collection).to receive(:items).and_return(["items"])
    allow(@client).to receive(:collect_params).with(TEST_PATH, TEST_PARAMS).and_return(TEST_PARAMS)
    allow(@connection).to receive(:get).with(TEST_PATH, TEST_PARAMS).and_return(response)
    allow(response).to receive(:body).and_return("body")
    allow(RubyOctopus::Model::ResourceCollection).to receive(:new).with("body", clazz).and_return(resource_collection)

    resources = @client.list(TEST_PATH, clazz, TEST_PARAMS)

    expect(resources.items).to eq(["items"])
  end

  it "paginates" do
    accumulator = []

    clazz = double("Class")
    page_func = lambda do |page|
      accumulator.concat(page.items)
      true
    end
    resource_collection1 = double("ResourceCollection1")
    resource_collection2 = double("ResourceCollection2")
    resource_collection3 = double("ResourceCollection3")
    allow(resource_collection1).to receive(:items).and_return([1])
    allow(resource_collection1).to receive(:link?).with("Page.Next").and_return(true)
    allow(resource_collection1).to receive(:link).with("Page.Next").and_return("next1")
    allow(resource_collection2).to receive(:items).and_return([2])
    allow(resource_collection2).to receive(:link?).with("Page.Next").and_return(true)
    allow(resource_collection2).to receive(:link).with("Page.Next").and_return("next2")
    allow(resource_collection3).to receive(:items).and_return([3])
    allow(resource_collection3).to receive(:link?).with("Page.Next").and_return(false)
    allow(@client).to receive(:list).with(TEST_PATH, clazz, TEST_PARAMS).and_return(resource_collection1)
    allow(@client).to receive(:list).with("next1", clazz).and_return(resource_collection2)
    allow(@client).to receive(:list).with("next2", clazz).and_return(resource_collection3)

    @client.paginate(TEST_PATH, TEST_PARAMS, clazz, page_func)

    expect(accumulator.length).to be 3
    expect(accumulator[0]).to be 1
    expect(accumulator[1]).to be 2
    expect(accumulator[2]).to be 3
  end
end
