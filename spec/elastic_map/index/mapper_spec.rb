# frozen_string_literal: true

describe ElasticMap::Index::Mapper do
  context '_index_hash mapper' do
    let(:user) { UsersIndex.new }

    before do
      user._index_hash = { username: 'jon' }
    end

    it 'should map data to index' do
      expect(user.username).to eq('jon')
    end
  end
end
