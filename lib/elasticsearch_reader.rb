# frozen_string_literal: true

require 'singleton'
require 'elasticsearch'

require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/module/delegation'

require 'elasticsearch_reader/version'
require 'elasticsearch_reader/config'

# You Know What It Is :D
module ElasticsearchReader
  class << self
    # Main elasticsearch-ruby client instance
    #
    def client
      ::Elasticsearch::Client.new(configuration)
    end

    def config
      ElasticsearchReader::Config.instance
    end
    delegate(*ElasticsearchReader::Config.delegated, to: :config)
  end
end
