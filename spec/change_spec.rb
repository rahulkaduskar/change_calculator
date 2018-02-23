# RSPEC Unit Tests:

require 'spec_helper'
require "./lib/change"

RSpec.describe Change do

  it "returns {pennies: 1} for 1" do
    expect(Change.change(1)).to include(pennies: 1)
  end

  it "raise exception for invalid amount" do
    expect(Change.change(-48)).to eq("Invalid Amount. Amount should be positive number")
  end

  it "returns {:quarters=>1, :dimes=>1, :nickels=>1, :pennies=>1} for 41" do
    expect(Change.change(41)).to include(
        :quarters=>1, :dimes=>1, :nickels=>1, :pennies=>1)
  end

end