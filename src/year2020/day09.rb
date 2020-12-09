module Year2020
  class Day09
    def part1(input, preamble_size)
      XMASDecoder.new(input, preamble_size).find_first_invalid
    end

    def part2(input, preamble_size)
      decoder = XMASDecoder.new(input, preamble_size)
      target_sum = decoder.find_first_invalid
      decoder.find_contiguous_numbers_adding_up_to(target_sum)
    end
  end

  class XMASDecoder
    def initialize(stream, preamble_size)
      @stream            = stream
      @lookback_distance = preamble_size
    end

    def find_first_invalid
      @stream.each_cons(@lookback_distance + 1).find do |pack|
        *group, target = pack
        group.combination(2).none? { |duo| target == duo.sum }
      end.last
    end

    def find_contiguous_numbers_adding_up_to(sum)
      (2..@stream.length).each do |n|
        @stream.each_cons(n) do |contiguous|
          return contiguous.minmax.sum if contiguous.sum == sum
        end
      end
    end
  end
end
