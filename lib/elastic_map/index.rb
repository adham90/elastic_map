# frozen_string_literal: true

require 'elastic_map/index/mapper'

module ElasticMap
  # Index base class, allows you to convert your object to ElasticMap::Index
  # object.
  #
  #   class UsersIndex < ElasticMap::Index
  #   end
  #
  class Index
    include Mapper

    singleton_class.delegate :client, to: ElasticMap

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
    end
  end
end
