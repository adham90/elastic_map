# frozen_string_literal: true

require 'spec_helper'

describe ElasticMap::Index::Mapper do
  context '_index_data mapper' do
    let(:user) { UsersIndex.new }

    before do
      user._index_data = { "username": 'jon' }
    end

    it 'should map data to index' do
      expect(user.username).to eq('jon')
    end

    it 'convert to_hash' do
      expect(user.to_hash).to eq(username: 'jon')
    end
  end
end
