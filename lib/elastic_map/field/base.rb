# frozen_string_literal: true

require 'elastic_map/field/type/string'
require 'elastic_map/field/type/integer'

module ElasticMap
  module Field
    # Field base class. Provides the main functionality for field object.
    #
    # @name [String] the field name that will be used to mapd.
    # @options [Hash] this hash will contain the filed options like lable
    # and type and default value.
    # @type [ElasticMap::Field::Type] this attr contain ElasticMap filed type.
    class Base
      attr_reader :name, :options, :type

      def initialize(name, options = {})
        options.deep_symbolize_keys!
        @name        = name.to_sym
        @options     = options
        @label       = options[:as]
        @type        = options[:type]
        @default_val = options[:default]
        include_race
      end

      # Return ElasticMap::Field::Type.
      #
      # @return [ElasticMap::Field::Type] convert filed type into ElasticMap
      # type.
      def type
        @type = options[:type] || String
        "ElasticMap::Field::Type::#{@type.name}"
      end

      private

      def include_race
        extend type.constantize
      end
    end
  end
end
