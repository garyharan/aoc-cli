module Year2020
  class Day03
    def part1(input)
      traverse_count(input, 3, 1)
    end

    def part2(input)
      traverse_count(input, 1, 1) *
        traverse_count(input, 3, 1) *
        traverse_count(input, 5, 1) *
        traverse_count(input, 7, 1) *
        traverse_count(input, 1, 2)
    end

    def traverse_count(input, x_offset, y_offset)
      input.reject.with_index do |line, y|
        y % y_offset != 0
      end.map.with_index do |line, y|
        line[(y * x_offset) % input.first.length]
      end.count("#")
    end
  end
end
