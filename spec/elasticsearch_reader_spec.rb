# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ElasticsearchReader do
  it 'has a version number' do
    expect(ElasticsearchReader::VERSION).not_to be nil
  end

  # TODO: write test cases for .client method
  context '.client' do
    it 'should return Elasticsearch::Client object' do
      expect(subject.client.class).to eq(::Elasticsearch::Client.new.class)
    end
  end
end
