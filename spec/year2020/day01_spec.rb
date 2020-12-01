require 'spec_helper'
require 'pry'

RSpec.describe Year2020::Day01 do
  let(:input) { File.open("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-01").readlines.map(&:chomp).map(&:to_i) }


  describe "part1" do
    it "solves part1" do
      d = Year2020::Day01.new
      expect(d.part1(input)).to eq(910539)
    end
  end

  describe "part2" do
    it "solves part2" do
      d = Year2020::Day01.new
      expect(d.part2(input)).to eq(nil)
    end
  end
end
