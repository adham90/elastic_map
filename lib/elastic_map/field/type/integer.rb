# frozen_string_literal: true

module ElasticMap
  module Field
    module Type
      # Integer parser.
      #
      module Integer
        def parse(data)
          data.to_i
        end
      end
    end
  end
end
