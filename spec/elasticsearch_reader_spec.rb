# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ElasticsearchReader do
  it 'has a version number' do
    expect(ElasticsearchReader::VERSION).not_to be nil
  end
end
