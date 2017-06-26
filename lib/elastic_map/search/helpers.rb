# frozen_string_literal: true

module ElasticMap
  class Search
    module Helpers
      class << self
        def first
          new(username: 'first_name')
        end
      end
    end
  end
end
