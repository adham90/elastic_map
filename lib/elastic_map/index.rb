# frozen_string_literal: true

require 'elastic_map/index/mapper'
require 'elastic_map/index/base'
require 'elastic_map/field/base'

module ElasticMap
  # Index base class, allows you to convert your object to ElasticMap::Index
  # object.
  #
  #   class UsersIndex < ElasticMap::Index
  #   end
  #
  class Index
    include Mapper
    include Base

    singleton_class.delegate :client, to: ElasticMap

    class_attribute :fields
    self.fields = []

    def initialize
      fields.each do |f|
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

      def field(name, options = {})
        fields << Field::Base.new(name, options)
      end
    end
  end
end
