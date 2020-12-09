require 'spec_helper'

RSpec.describe Year2020::Day09 do
  describe "with test data" do
    let(:input) do
      File.open("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-09.sample").readlines.map(& -> (n) { n.chomp.to_i })
    end

    it "solves part1" do
      d = Year2020::Day09.new
      expect(d.part1(input, 5)).to eq(127)
    end

    it "solves part2" do
      d = Year2020::Day09.new
      expect(d.part2(input, 5)).to eq(62)
    end
  end

  describe "with real data" do
    let(:input) do
      File.open("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-09").readlines.map(& -> (n) { n.chomp.to_i })
    end

    it "solves part1" do
      d = Year2020::Day09.new
      expect(d.part1(input, 25)).to eq(756008079)
    end

    it "solves part2" do
      d = Year2020::Day09.new
      expect(d.part2(input, 25)).to eq(93727241)
    end
  end
end

