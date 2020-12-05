module Year2020
  class Day05
    def part1(input)
      input.map { |code| Seat.new(code).id }.max
    end

    def part2(input)
      ids = input.map { |code| Seat.new(code).id }

      min, max = ids.minmax

      (min..max).inject(&:+) - ids.inject(&:+)
    end
  end

  class Seat
    def initialize(code)
      @code = code
    end

    def id
      @code.slice(0, 7).tr("BF", "10").to_i(2) * 8 + @code.slice(7, 3).tr("RL", "10").to_i(2)
    end
  end
end
