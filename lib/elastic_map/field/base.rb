# frozen_string_literal: true

require 'elastic_map/field/type/string'
require 'elastic_map/field/type/integer'

module ElasticMap
  module Field
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

      def type
        @type = options[:type] || String
        "ElasticMap::Field::Type::#{@type.name}"
      end

      private

      def include_race
        self.extend type.constantize
      end
    end
  end
end
