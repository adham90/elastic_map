module ElasticMap
  class Index
    module Base
      def _index_hash
        {
          "name": "adham",
          "phone": 123
        }.to_hash
      end
    end
  end
end
