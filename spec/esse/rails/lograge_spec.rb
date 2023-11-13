# frozen_string_literal: true

require "spec_helper"
require "lograge"
require "esse/rails/lograge"

RSpec.describe Esse::Rails::Lograge do
  before do
    described_class::Railtie.run_initializers
  end

  it "customizes the Lograge configuration" do
    expect(described_class::Railtie.initializers.find { |i| i.name == "esse.lograge" }).not_to be_nil
  end
end
