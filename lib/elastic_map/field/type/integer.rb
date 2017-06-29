# frozen_string_literal: true

module ElasticMap
  module Field
    module Type
      # Integer parser.
      #
      module Integer
        module ClassMethods
          def _parse(data)
            data.to_i
          end
        end
      end
    end
  end
end

::Integer.__send__(:include, ElasticMap::Field::Type::Integer)
::Integer.extend(ElasticMap::Field::Type::Integer::ClassMethods)
