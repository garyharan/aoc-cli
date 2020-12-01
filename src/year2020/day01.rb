module Year2020
  class Day01
    def part1(input)
      input.combination(2).find { |a, b| a + b == 2020 }.flatten.inject(:*)
    end

    def part2(input)
      input.combination(3).find { |a, b, c| a + b + c == 2020 }.flatten.inject(:*)
    end
  end
end
