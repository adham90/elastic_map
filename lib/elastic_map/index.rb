# frozen_string_literal: true

require 'elastic_map/index/base'
require 'elastic_map/index/inspector'
require 'elastic_map/index/mapper'
require 'elastic_map/index/helpers'
require 'elastic_map/field/base'
require 'elastic_map/search/helpers'

module ElasticMap
  # Index base class, allows you to convert your object to ElasticMap::Index
  # object.
  #
  #   class UsersIndex < ElasticMap::Index
  #   end
  #
  class Index
    include Base
    include Mapper
    include Helpers
    include Inspector
    extend Search::Helpers

    singleton_class.delegate :client, to: ElasticMap

    class_attribute :fields, :_index_data
    self.fields      = []
    self._index_data = {}

    def initialize(data = {})
      @_index_data = data

      fields.each do |f|
        f.klass = self

        define_singleton_method(f.name) do
          map_field(f)
        end
      end
    end

    # Returns Elasticsearch index name
    #
    #   class UsersIndex < ElasticMap::Index
    #   end
    #   UsersIndex.new.index_name # => 'users'
    #
    #   class UsersIndex < ElasticMap::Index
    #     indexed_in :user_profile
    #   end
    #   UsersIndex.new.index_name # => 'user_profile'
    #
    def index_name
      self.class.index_name
    end

    class << self
      # Returns Elasticsearch index name
      #
      #   class UsersIndex < ElasticMap::Index
      #   end
      #   UsersIndex.index_name # => 'users'
      #
      #   class UsersIndex < ElasticMap::Index
      #     indexed_in :user_profile
      #   end
      #   UsersIndex.index_name # => 'user_profile'
      #
      def index_name
        @index_name || name.sub(/Index\Z/, '').demodulize.underscore
      end

      # Set Elasticsearch index name
      #
      #   class UsersIndex < ElasticMap::Index
      #     indexed_in :user_profile
      #   end
      #   UsersIndex.index_name # => 'user_profile'
      #   UsersIndex.new.index_name # => 'user_profile'
      #
      def indexed_in(suggest)
        @index_name = suggest.to_s
      end

      # Defines mapping field for current type
      #
      #   class UsersIndex < ElasticMap::Index
      #     field :full_name, type: 'string', analyzer: 'special'
      #   end
      #
      # The `type` is optional and defaults to `string` if not defined:
      #
      #   field :full_name
      #
      # Also, multiple fields might be defined with one call and
      # with the same options:
      #
      #   field :first_name, :last_name, analyzer: 'special'
      #
      # You also can pass block as a field type the block will receive
      # the field data.
      #
      #   class UserIndex < ElasticMap
      #     field :name, type: -> { |v| v.to_s }
      #   end
      #
      # The proc evaluates inside the indexed object context if
      # its arity is 0 and in present contexts if there is an argument:
      #
      #   field :full_name, type: -> { [first_name, last_name].join(' ') }
      #
      #   separator = ' '
      #   field :full_name, type: ->(user) {
      #     [user.first_name, user.last_name].join(separator)
      #   }
      #
      # If array was returned as value - it will be put in index as well.
      #
      #   field :tags, type: -> { tags.map(&:name) }
      #
      # Fields supports nesting in case of `object` field type. If
      # `user.quiz` will return an array of objects, then result index content
      # will be an array of hashes, if `user.quiz` is not a collection
      # association then just values hash will be put in the index.
      #
      #   field :quiz do
      #     field :question, :answer
      #     field :score, type: 'integer'
      #   end
      #
      # Nested fields are composed from nested objects:
      #
      #   field :name, type: -> { name_translations } do
      #     field :ru, type: ->(name) { name['ru'] }
      #     field :en, type: ->(name) { name['en'] }
      #   end
      #
      # Of course it is possible to define object fields contents dynamically
      # but make sure evaluation proc returns hash:
      #
      #   field :name, type: -> { name_translations }
      #
      # The special case is multi_field. If type options and block are
      # both present field is treated as a multi-field. In that case field
      # composition changes satisfy elasticsearch rules:
      #
      #   field :full_name, type: ->{ full_name.try(:strip) } do
      #     field :sorted, analyzer: 'sorted'
      #   end
      #
      def field(name, options = {})
        fields << Field::Base.new(name, options)
      end
    end
  end
end
