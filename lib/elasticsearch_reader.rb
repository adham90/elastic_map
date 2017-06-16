# frozen_string_literal: true

require 'active_support/concern'
require 'active_support/deprecation'
require 'active_support/json'
require 'active_support/log_subscriber'

require 'active_support/core_ext/array/access'
require 'active_support/core_ext/array/wrap'
require 'active_support/core_ext/enumerable'
require 'active_support/core_ext/hash/reverse_merge'
require 'active_support/core_ext/numeric/time'
require 'active_support/core_ext/numeric/bytes'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/object/inclusion'
require 'active_support/core_ext/string/inflections'

require 'singleton'
require 'elasticsearch_reader/version'
require 'elasticsearch_reader/config'

module ElasticsearchReader
  # Your code goes here...
  class << self
    def config
      ElasticsearchReader::Config.instance
    end
    delegate(*ElasticsearchReader::Config.delegated, to: :config)
  end
end
