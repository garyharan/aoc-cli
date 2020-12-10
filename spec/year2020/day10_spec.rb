require 'spec_helper'

RSpec.describe Year2020::Day10 do
  describe "with test data" do
    describe "with sample 1" do
      let(:input) do
        File.readlines("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-10.sample").map(&:chomp)
      end

      it "solves part1" do
        d = Year2020::Day10.new
        expect(d.part1(input)).to eq(35)
      end

      it "solves part2" do
        d = Year2020::Day10.new
        expect(d.part2(input)).to eq(8)
      end
    end

    describe "with sample 2" do
      let(:input) do
        File.readlines("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-10.sample2").map(&:chomp)
      end

      it "solves part1" do
        d = Year2020::Day10.new
        expect(d.part1(input)).to eq(220)
      end

      it "solves part2" do
        d = Year2020::Day10.new
        expect(d.part2(input)).to eq(19208)
      end
    end
  end

  describe "with real data" do
    let(:input) do
      File.readlines("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-10").map(&:chomp)
    end

    it "solves part1" do
      d = Year2020::Day10.new
      expect(d.part1(input)).to eq(1890)
    end

    it "solves part2" do
      d = Year2020::Day10.new
      expect(d.part2(input)).to eq(49607173328384)
    end
  end
end
