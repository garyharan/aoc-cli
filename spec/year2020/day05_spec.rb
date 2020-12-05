require 'spec_helper'

RSpec.describe Year2020::Day05 do
  let(:input) { File.open("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-05").readlines.map(&:chomp) }

  it "solves part1" do
    d = Year2020::Day05.new
    expect(d.part1(input)).to eq(994)
  end

  it "solves part2" do
    d = Year2020::Day05.new
    expect(d.part2(input)).to eq(741)
  end
end
