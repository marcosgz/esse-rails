# frozen_string_literal: true

require "spec_helper"
require "lograge"
require "esse/rails/lograge"

RSpec.describe "Esse Event subscribe integration" do
  before do
    Esse::Rails::Lograge::Railtie.run_initializers
  end

  it "customizes the Lograge configuration" do
    expect(Esse::Rails::Lograge::Railtie.initializers.find { |i| i.name == "esse.lograge" }).not_to be_nil
  end
end
