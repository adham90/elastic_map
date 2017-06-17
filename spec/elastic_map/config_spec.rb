# frozen_string_literal: true

require 'spec_helper'
require 'logger'

describe ElasticMap::Config do
  subject { described_class.send(:new) }

  its(:logger) { should be_nil }
  its(:indices_path) { should == 'app/indices' }

  describe '#transport_logger=' do
    let(:logger) { Logger.new('/dev/null') }

    specify do
      expect { subject.logger = logger }
        .to change { subject.logger }.to(logger)
    end
  end

  describe '#configuration' do
    before { subject.settings = { indices_path: 'app/foobar' } }

    specify do
      expect(subject.configuration).to include(indices_path: 'app/foobar')
    end
  end
end
