require 'spec_helper'

RSpec.describe Year2020::Day02 do
  let(:input) { File.open("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-02").readlines.map(&:chomp) }

  describe "part1" do
    it "solves part1" do
      d = Year2020::Day02.new
      expect(d.part1(input)).to eq(586)
    end
  end

  describe "part2" do
    it "solves part2" do
      d = Year2020::Day02.new
      expect(d.part2(input)).to eq(352)
    end
  end
end

RSpec.describe Year2020::ToboganRentalPasswordPolicy do
  describe "only one letter matches" do
    let(:line) { Year2020::PasswordLine.new("1-3 a: abcde") }

    it "should be valid" do
      expect(Year2020::ToboganRentalPasswordPolicy.new(line)).to be_valid
    end
  end

  describe "both letters match position" do
    let(:line) { Year2020::PasswordLine.new("2-9 c: ccccccccc") }

    it "should be invalid" do
      expect(Year2020::ToboganRentalPasswordPolicy.new(line)).to_not be_valid
    end
  end

  describe "neither letters match position" do
    let(:line) { Year2020::PasswordLine.new("1-3 b: cdefg") }

    it "should be invalid" do
      expect(Year2020::ToboganRentalPasswordPolicy.new(line)).to_not be_valid
    end
  end

end

RSpec.describe Year2020::SledRentalPasswordPolicy do
  describe "valid line" do
    let(:line) { Year2020::PasswordLine.new("2-9 c: ccccccccc") }

    subject { Year2020::SledRentalPasswordPolicy.new(line) }

    it "should be valid" do
      is_expected.to be_valid
    end
  end

  describe "invalid line" do
    let(:line) { Year2020::PasswordLine.new("1-3 b: cdefg") }

    subject { Year2020::SledRentalPasswordPolicy.new(line) }

    it "should be valid" do
      is_expected.to_not be_valid
    end
  end
end
