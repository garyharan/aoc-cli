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

RSpec.describe Year2020::RowPosition.new("FBFBBFFRLR").to_i do
  it { is_expected.to eq 44 }
end

RSpec.describe Year2020::ColumnPosition.new("FBFBBFFRLR").to_i do
  it { is_expected.to eq 5 }
end

# BFFFBBFRRR: row 70, column 7, seat ID 567
RSpec.describe Year2020::RowPosition.new("BFFFBBFRRR").to_i do
  it { is_expected.to eq 70 }
end

RSpec.describe Year2020::ColumnPosition.new("BFFFBBFRRR").to_i do
  it { is_expected.to eq 7 }
end

RSpec.describe Year2020::Day05.new.part1(["BFFFBBFRRR"]) do
  it { is_expected.to eq 567 }
end
