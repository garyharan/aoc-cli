require 'spec_helper'

RSpec.describe Year2020::Day08 do
  describe "with test data" do
    let(:input) do
      File.open("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-08.sample").readlines.map(&:chomp)
    end

    it "solves part1" do
      d = Year2020::Day08.new
      expect(d.part1(input)).to eq(5)
    end

    it "solves part2" do
      d = Year2020::Day08.new
      expect(d.part2(input)).to eq(8)
    end
  end

  describe "with real data" do
    let(:input) do
      File.open("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-08").readlines.map(&:chomp)
    end

    it "solves part1" do
      d = Year2020::Day08.new
      expect(d.part1(input)).to eq(1501)
    end

    it "solves part2" do
      d = Year2020::Day08.new
      expect(d.part2(input)).to eq(509)
    end
  end
end
