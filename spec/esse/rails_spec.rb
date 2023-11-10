# frozen_string_literal: true

require "spec_helper"

RSpec.describe Esse::Rails do
  it "has a version number" do
    expect(Esse::Rails::VERSION).not_to be_nil
  end
end
