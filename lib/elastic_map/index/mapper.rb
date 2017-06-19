# frozen_string_literal: true

module ElasticMap
  class Index
    # Map Elasticsearch results to ElasticMap::Index object
    module Mapper
      def map_field(field)
        field.parse(_index_hash[field.name])
      end
    end
  end
end
