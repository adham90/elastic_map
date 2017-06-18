# frozen_string_literal: true

require 'spec_helper'

class UsersIndex < ElasticMap::Index
end

class UsersProfileIndex < ElasticMap::Index
  indexed_in :profile
end

describe ElasticMap::Index do
  subject { UsersIndex }

  its(:index_name) { should == 'users' }

  it '.index_name' do
    expect(UsersIndex.new.index_name).to eq('users')
  end

  context '#indexed_in' do
    subject { UsersProfileIndex }

    its(:index_name) { should == 'profile' }

    it '.index_name' do
      expect(UsersProfileIndex.new.index_name).to eq('profile')
    end
  end
end
