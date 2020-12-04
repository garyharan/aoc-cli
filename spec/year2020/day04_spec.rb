require 'spec_helper'

RSpec.describe Year2020::Day04 do
  let(:input) { File.read("53616c7465645f5f3a68658722713661b7cbbd136df7c86ffed14028dc4e57b7a1da629a43ade83843e0510566d14851/2020/day-04") }

  it "solves part1" do
    d = Year2020::Day04.new
    expect(d.part1(input)).to eq 247
  end

  it "solves part2" do
    d = Year2020::Day04.new
    expect(d.part2(input)).to eq 145
  end
end

RSpec.describe Year2020::HashPassportComplexValidator do
  # byr (Birth Year) - four digits; at least 1920 and at most 2002.
  describe "Birth Years" do
    let(:key)      { "byr" }
    let(:valids)   { %w(2002).freeze }
    let(:invalids) { %w(1900 2003 3018).freeze }

    let(:subject) { Year2020::HashPassportComplexValidator }

    it "should validate" do
      expect(valids.all?    { |v| subject.new({"#{key}" => v}).valid_birth_year? }).to be true
      expect(invalids.none? { |v| subject.new({"#{key}" => v}).valid_birth_year? }).to be true
    end
  end

  describe "Issue years" do
    let(:key)      { "iyr" }
    let(:valids)   { (2010..2020).freeze }
    let(:invalids) { %w(1900 2003 3018 2009 2021).freeze }

    let(:subject) { Year2020::HashPassportComplexValidator }

    it "should validate" do
      expect(valids.all?    { |v| subject.new({"#{key}" => v}).valid_issue_year? }).to be true
      expect(invalids.none? { |v| subject.new({"#{key}" => v}).valid_issue_year? }).to be true
    end
  end

  describe "Expiration year" do
    let(:key)      { "eyr" }
    let(:valids)   { (2020..2030).freeze }
    let(:invalids) { %w(1900 2003 3018 2019 2031).freeze }

    let(:subject) { Year2020::HashPassportComplexValidator }

    it "should validate" do
      expect(valids.all?    { |v| subject.new({"#{key}" => v}).valid_expiration_year? }).to be true
      expect(invalids.none? { |v| subject.new({"#{key}" => v}).valid_expiration_year? }).to be true
    end
  end

end
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
# If cm, the number must be at least 150 and at most 193.
# If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.
