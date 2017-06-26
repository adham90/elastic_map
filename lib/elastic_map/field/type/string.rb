# frozen_string_literal: true

module ElasticMap
  module Field
    module Type
      # String parser.
      #
      module String
        module ClassMethods
          def _parse(data)
            data.to_s
          end
        end
      end
    end
  end
end

::String.__send__(:include, ElasticMap::Field::Type::String)
::String.extend(ElasticMap::Field::Type::String::ClassMethods)
