# frozen_string_literal: true

module ElasticMap
  class Index
    # ElasticMap helper methods
    #
    module Helpers
      def to_hash
        _index_data.to_hash
      end

      def to_json
        _index_data
      end
    end
  end
end
