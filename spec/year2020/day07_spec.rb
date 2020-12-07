require 'spec_helper'

RSpec.describe Year2020::Day07 do
  let(:input) do
    File.open("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-07").readlines.map(&:chomp)
  end

  before(:each) do
    class Year2020::Bag
      @bags = {}
    end
  end

  it "solves part1" do
    d = Year2020::Day07.new
    expect(d.part1(input)).to eq(121)
  end

  it "solves part2" do
    d = Year2020::Day07.new
    expect(d.part2(input)).to eq(3805)
  end
end
