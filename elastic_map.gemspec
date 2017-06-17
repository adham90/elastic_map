# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elastic_map/version'

Gem::Specification.new do |spec|
  spec.name          = 'elastic_map'
  spec.version       = ElasticMap::VERSION
  spec.authors       = ['adham90']
  spec.email         = ['adham.eldeeb90@gmail.com']

  spec.summary       = 'Read-Only Elasticsearch ODM clinet wrapper'
  spec.description   = 'ElasticMap ODM (Object Document Mapper) provides functionality for chainable query DSL in a OO style'
  spec.homepage      = 'https://github.com/adham90/elastic_map'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['yard.run'] = 'yri'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'redcarpet'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'rubocop', '0.48.1'
  spec.add_development_dependency 'rspec-collection_matchers'
  spec.add_development_dependency 'appraisal'

  spec.add_dependency 'activesupport'
  spec.add_dependency 'elasticsearch', '>= 5.0.0'
  spec.add_dependency 'elasticsearch-dsl'
end
