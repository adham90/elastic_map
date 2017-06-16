# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elasticsearch_reader/version'

Gem::Specification.new do |spec|
  spec.name          = 'elasticsearch_reader'
  spec.version       = ElasticsearchReader::VERSION
  spec.authors       = ['adham90']
  spec.email         = ['adham.eldeeb90@gmail.com']

  spec.summary       = 'Read-Only Elasticsearch ODM clinet wrapper'
  spec.description   = 'ElasticsearchReader ODM (Object Document Mapper) provides functionality for chainable query DSL in a OO style'
  spec.homepage      = 'https://github.com/adham90/elasticsearch_reader'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['yard.run'] = 'yri'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'rubocop', '0.48.1'
  spec.add_development_dependency 'rspec-collection_matchers'
  spec.add_development_dependency 'appraisal'

  spec.add_dependency 'elasticsearch', '>= 5.0.0'
  spec.add_dependency 'elasticsearch-dsl'
end
