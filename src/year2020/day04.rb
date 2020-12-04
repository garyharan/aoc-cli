module Year2020
  class Day04
    def part1(input)
      parse(input).count(& -> (h) { HashPassportSimpleValidator.new(h).valid? })
    end

    def part2(input)
      parse(input).count(& -> (h) { HashPassportComplexValidator.new(h).valid? })
    end

    private

    def parse(input)
      input.split("\n\n").map { |line| Hash[line.split.map {|x| x.split(":") }] }
    end
  end

  class HashPassportSimpleValidator
    REQUIRED_PASSPORT_KEYS = %w(byr iyr eyr hgt hcl ecl pid).freeze

    def initialize(hash)
      @hash = hash
    end

    def valid?
      (REQUIRED_PASSPORT_KEYS - @hash.keys).none?
    end
  end

  class HashPassportComplexValidator < HashPassportSimpleValidator
    VALID_EYE_COLORS = %w(amb blu brn gry grn hzl oth).freeze

    def initialize(hash)
      @hash = hash
    end

    def valid?
      super &&
        valid_birth_year? &&
        valid_issue_year? &&
        valid_expiration_year? &&
        valid_height? &&
        valid_hair_color? &&
        valid_eye_color? &&
        valid_password_id?
    end

    def valid_birth_year?
      @hash["byr"].to_i >= 1920 && @hash["byr"].to_i <= 2002
    end

    def valid_issue_year?
      @hash["iyr"].to_i >= 2010 && @hash["iyr"].to_i <= 2020
    end

    def valid_expiration_year?
      @hash["eyr"].to_i >= 2020 && @hash["eyr"].to_i <= 2030
    end

    def valid_height?
      /(?<height>\d+)(?<system>\w\w)/ =~ @hash["hgt"]
      return true if system == "cm" && height.to_i >= 150 && height.to_i <= 193
      return true if system == "in" && height.to_i >= 59  && height.to_i <= 76
      false
    end

    def valid_hair_color?
      @hash["hcl"] =~ /^#[a-fA-F0-9]{6}$/
    end

    def valid_eye_color?
      VALID_EYE_COLORS.any?(@hash["ecl"])
    end

    def valid_password_id?
      @hash["pid"] =~ /^\d{9}$/
    end
  end
end
