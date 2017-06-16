# frozen_string_literal: true

require 'spec_helper'

describe ElasticsearchReader::Config do
  subject { described_class.send(:new) }

  its(:logger) { should be_nil }
  its(:indices_path) { should == 'app/indices' }

  describe '#configuration' do
    before { subject.settings = { indices_path: 'app/foobar' } }

    specify do
      expect(subject.configuration).to include(indices_path: 'app/foobar')
    end
  end
end
