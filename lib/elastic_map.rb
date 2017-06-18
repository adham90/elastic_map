# frozen_string_literal: true

require 'singleton'
require 'elasticsearch'

require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/string/filters'

require 'elastic_map/version'
require 'elastic_map/config'
require 'elastic_map/index'

# You Know What It Is :D
module ElasticMap
  class << self
    # Main elasticsearch-ruby client instance
    #
    def client
      ::Elasticsearch::Client.new(configuration)
    end

    def config
      ElasticMap::Config.instance
    end
    delegate(*ElasticMap::Config.delegated, to: :config)
  end
end
