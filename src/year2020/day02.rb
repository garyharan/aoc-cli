require "pry"

module Year2020
  class Day02
    def part1(input)
      input.count do |line|
        SledRentalPasswordPolicy.new(PasswordLine.new(line)).valid?
      end
    end

    def part2(input)
      input.count do |line|
        ToboganRentalPasswordPolicy.new(PasswordLine.new(line)).valid?
      end
    end
  end

  class PasswordLine
    MATCH_PATTERN = /(?<min>\d+)-(?<max>\d+) (?<letter>[a-z]): (?<input>\w+)/

    attr_reader :min, :max, :letter, :input

    def initialize(line)
      matches = MATCH_PATTERN.match(line)

      @min    = matches[:min].to_i
      @max    = matches[:max].to_i
      @letter = matches[:letter]
      @input  = matches[:input]
    end
  end

  class ToboganRentalPasswordPolicy
    def initialize(line)
      @line = line
    end

    def valid?
      min_match = @line.input[@line.min - 1] == @line.letter
      max_match = @line.input[@line.max - 1] == @line.letter

      min_match ^ max_match
    end
  end

  class SledRentalPasswordPolicy
    def initialize(line)
      @line = line
    end

    def valid?
      stripped_password_length >= @line.min && stripped_password_length <= @line.max
    end

    private

    def stripped_password_length
      @stripped_password_length ||= @line.input.count(@line.letter)
    end
  end
end

