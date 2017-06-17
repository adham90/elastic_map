# ElasticsearchReader
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
[![Code Climate](https://codeclimate.com/github/adham90/elasticsearch_reader/badges/gpa.svg)](https://codeclimate.com/github/adham90/elasticsearch_reader)
[![Issue Count](https://codeclimate.com/github/adham90/elasticsearch_reader/badges/issue_count.svg)](https://codeclimate.com/github/adham90/elasticsearch_reader)
[![Build Status](https://travis-ci.org/adham90/elasticsearch_reader.svg?branch=master)](https://travis-ci.org/adham90/elasticsearch_reader)
[![CircleCI](https://circleci.com/gh/adham90/elasticsearch_reader.svg?style=svg)](https://circleci.com/gh/adham90/elasticsearch_reader)
[![Join the chat at https://gitter.im/ElasticsearchReader/Lobby](https://badges.gitter.im/ElasticsearchReader/Lobby.svg)](https://gitter.im/ElasticsearchReader/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

ElasticsearchReader is an ODM for Elasticsearch and query DSL in a OO style.

## Why ElasticsearchReader?

TODO: Write why ElasticsearchReader here

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elasticsearch_reader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elasticsearch_reader

## Usage

### Client settings

There are two ways to configure the ElasticsearchReader client: the `ElasticsearchReader.settings` hash and `elasticsearch_reader.yml`

You can create this file manually or run `rails g elasticsearch_reader:install`.

```ruby
# config/initializers/elasticsearch_reader.rb
ElasticsearchReader.settings = {host: 'localhost:9250'} # do not use environments
```

```yaml
# config/elasticsearch_reader.yml
# separate environment configs
test:
  host: 'localhost:9250'
  prefix: 'test'
development:
  host: 'localhost:9200'
```

The logger may be set explicitly:

```ruby
ElasticsearchReader.logger = Logger.new(STDOUT)
```
See [config.rb](lib/elasticsearch_reader/config.rb) for more details.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## TODO

 - [x] [Configrations and settings](https://github.com/adham90/elasticsearch_reader/projects/1#card-3395198)
 - [ ] [Object mapper](https://github.com/adham90/elasticsearch_reader/projects/1#card-3393856)
 - [ ] [Query DSL](https://github.com/adham90/elasticsearch_reader/projects/1#card-3393917)
 - [ ] [Query helpers](https://github.com/adham90/elasticsearch_reader/projects/1#card-3393926)
 - [ ] [Relations](https://github.com/adham90/elasticsearch_reader/projects/1#card-3393910)
 - [ ] [Embedding](https://github.com/adham90/elasticsearch_reader/projects/1#card-3393932)
 - [ ] [Aggregations](https://github.com/adham90/elasticsearch_reader/projects/1#card-3395154)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adham90/elasticsearch_reader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

