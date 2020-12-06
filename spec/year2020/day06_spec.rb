require 'spec_helper'

RSpec.describe Year2020::Day06 do
  let(:input) { File.read("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-06").split("\n\n") }

  it "solves part1" do
    d = Year2020::Day06.new
    expect(d.part1(input)).to eq(6878)
  end

  it "solves part2" do
    d = Year2020::Day06.new
    expect(d.part2(input)).to eq(3464)
  end
end
