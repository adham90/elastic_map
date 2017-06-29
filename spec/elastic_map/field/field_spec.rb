# frozen_string_literal: true

require 'spec_helper'

describe ElasticMap::Field::Base do
  let(:user) do
    UsersIndex.new(
      first_name: 'adham',
      last_name: 'eldeeb',
      username: 'adham',
      age: '25',
      phone: nil,
      address: nil
    )
  end

  it 'should parse string type' do
    expect(user.username).to be_kind_of(String)
  end

  it 'should parse integer type' do
    expect(user.age).to be_kind_of(Integer)
  end

  context 'default values' do
    it 'should return default_val' do
      expect(user.address).to eq 'cairo'
    end

    it 'should parse the default val' do
      expect(user.phone).to eq(0)
    end

    it 'should handle default_val block' do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
