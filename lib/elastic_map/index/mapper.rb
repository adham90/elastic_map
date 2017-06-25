# frozen_string_literal: true

module ElasticMap
  class Index
    # Map Elasticsearch results to ElasticMap::Index object
    #
    module Mapper
      # Maps _index_hash to ElasticMap::Fields
      #
      # @param args [ElasticMap::Field] the parsing field.
      # return [Type] the parsed data.
      def map_field(field)
        field.parse(_index_hash[field.name])
      end
    end
  end
end
