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
      @stream.find.with_index do |number, index|
        next if index < @lookback_distance

        @stream.slice(index - @lookback_distance, @lookback_distance).combination(2).none? do |x, y|
          number == x + y
        end
      end
    end

    def find_contiguous_numbers_adding_up_to(sum)
      contiguous = []

      catch :contiguous_matched_sum do
        @stream.each.with_index do |number, index|
          contiguous = []

          slice = @stream.slice(index, @stream.length - index)

          slice.each.with_index do |number, jindex|
            contiguous << slice[jindex]

            if contiguous.length > 1
              next                          if contiguous.sum > sum
              throw :contiguous_matched_sum if contiguous.sum == sum
            end
          end
        end
      end
      contiguous.minmax.sum
    end
  end
end
