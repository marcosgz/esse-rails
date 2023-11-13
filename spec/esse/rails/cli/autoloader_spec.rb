# frozen_string_literal: true

require "spec_helper"

RSpec.describe Esse::Rails::CLI::Autoloader do
  let(:klass) do
    Class.new do
      def after_initialize
      end
    end
  end
  let(:cli) do
    Class.new(klass) do
      include Esse::Rails::CLI::Autoloader
    end
  end

  it "includes autoloader module to Esse::CLI::Root class" do
    expect(Esse::CLI::Root.ancestors).to include(described_class)
  end

  describe "#after_initialize" do
    it "loads Rails environment" do
      # rubocop:disable RSpec/MessageSpies
      # rubocop:disable RSpec/StubbedMock
      expect(File).to receive(:exist?).with(/config\/environment.rb/).and_call_original
      expect { cli.new.after_initialize }.not_to raise_error
      # rubocop:enable RSpec/MessageSpies
      # rubocop:enable RSpec/StubbedMock
    end
  end
end
