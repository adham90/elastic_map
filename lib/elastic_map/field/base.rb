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
      attr_reader :name, :options, :type, :default_val
      attr_accessor :klass

      delegate :_parse, to: :type

      def initialize(name, options = {})
        options.deep_symbolize_keys!
        @name        = name.to_sym
        @options     = options
        @label       = options[:as]
        @default_val = options[:default]
        define_default_method if default_val.respond_to?(:call) && klass
      end

      # Return ElasticMap::Field::Type.
      #
      # @return [ElasticMap::Field::Type] convert filed type into ElasticMap
      # type.
      def type
        @type ||= options[:type] || String
      end

      def parse(val)
        return evaluated_default if val.nil?

        _parse(val)
      end

      private

      def evaluated_default
        return evaluate_default_proc if default_val.respond_to?(:call)

        _parse(default_val)
      end

      def evaluate_default_proc
        _parse(klass.instance_exec(&default_val))
      end
    end
  end
end
