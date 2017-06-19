module ElasticMap
  module Field
    module Type
      module Integer
        def parse(data)
          data.to_i
        end
      end
    end
  end
end
