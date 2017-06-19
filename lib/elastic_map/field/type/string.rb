# frozen_string_literal: true

module ElasticMap
  module Field
    module Type
      module String
        def parse(data)
          data.to_s
        end

        def string(*args)

        end
      end
    end
  end
end
