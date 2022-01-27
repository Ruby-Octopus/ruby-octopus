# frozen_string_literal: true

require_relative "resource"

module RubyOctopus
  module Model
    # Paging object model containing a list of Resource items.
    class ResourceCollection < Resource
      attr_reader :item_type, :total_results, :items_per_page, :number_of_pages, :last_page_number, :items

      def initialize(attribute_values, item_class)
        raise ArgumentError, "Items cannot be nil." if attribute_values["Items"].nil?
        raise ArgumentError, "Links cannot be nil." if attribute_values["Links"].nil?

        super(attribute_values)
        @item_type = attribute_values["ItemType"]
        @total_results = attribute_values["TotalResults"]
        @items_per_page = attribute_values["ItemsPerPage"]
        @number_of_pages = attribute_values["NumberOfPages"]
        @last_page_number = attribute_values["LastPageNumber"]
        @items = attribute_values["Items"].map { |item| item_class.new(item) }
      end
    end
  end
end
