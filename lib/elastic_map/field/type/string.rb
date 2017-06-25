# frozen_string_literal: true

module ElasticMap
  module Field
    module Type
      # String parser.
      #
      module String
        def parse(data)
          data.to_s
        end
      end
    end
  end
end
