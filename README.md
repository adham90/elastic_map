# :shell: ElasticMap
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
[![Build Status](https://travis-ci.org/adham90/elastic_map.svg?branch=master)](https://travis-ci.org/adham90/elastic_map)
[![Join the chat at https://gitter.im/elastic_map/Lobby](https://badges.gitter.im/elastic_map/Lobby.svg)](https://gitter.im/elastic_map/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Dependency Status](https://gemnasium.com/badges/github.com/adham90/elastic_map.svg)](https://gemnasium.com/github.com/adham90/elastic_map)
[![Inline docs](http://inch-ci.org/github/adham90/elastic_map.svg?branch=master)](http://inch-ci.org/github/adham90/elastic_map)

ElasticMap ODM (Object-Document-Mapper) is a [mongoid](https://github.com/mongodb/mongoid)-like gem for [Elasticsearch](https://github.com/elastic/elasticsearch) that provides the functionality of chainable queries, embedding indexes, relations, and aggregations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elastic_map'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elastic_map

## Usage

### Client settings

There are two ways to configure the ElasticMap client: the `ElasticMap.settings` hash and `elastic_map.yml`

```ruby
# config/initializers/elastic_map.rb
ElasticMap.settings = {host: 'localhost:9250'} # do not use environments
```

```yaml
# config/elastic_map.yml
# separate environment configs
test:
  host: 'localhost:9250'
  prefix: 'test'
development:
  host: 'localhost:9200'
```

The logger may be set explicitly:

```ruby
ElasticMap.logger = Logger.new(STDOUT)
```
See [config.rb](lib/elastic_map/config.rb) for more details.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## TODO

 - [x] [Configrations and settings](https://github.com/adham90/elastic_map/projects/1#card-3395198)
 - [ ] [Create Index base class](https://github.com/adham90/elastic_map/projects/1#card-3398857)
 - [ ] [Object mapper](https://github.com/adham90/elastic_map/projects/1#card-3393856)
 - [ ] [Query DSL](https://github.com/adham90/elastic_map/projects/1#card-3393917)
 - [ ] [Query helpers](https://github.com/adham90/elastic_map/projects/1#card-3393926)
 - [ ] [Relations](https://github.com/adham90/elastic_map/projects/1#card-3393910)
 - [ ] [Embedding](https://github.com/adham90/elastic_map/projects/1#card-3393932)
 - [ ] [Aggregations](https://github.com/adham90/elastic_map/projects/1#card-3395154)
 - [ ] [Analyzer](https://github.com/adham90/elastic_map/projects/1#card-3395297)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adham90/elastic_map. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

