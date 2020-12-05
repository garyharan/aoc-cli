module Year2020
  class Day05
    def part1(input)
      input.map do |code|
        RowPosition.new(code).to_i * 8 + ColumnPosition.new(code).to_i
      end.max
    end

    def part2(input)
      ids = input.map do |code|
        RowPosition.new(code).to_i * 8 + ColumnPosition.new(code).to_i
      end

      min, max = ids.minmax

      (min..max).inject(&:+) - ids.inject(&:+)
    end

    private

    def parse(input)

    end
  end

  class RowPosition
    def initialize(code)
      @code = code.slice(0, 7)
    end

    def to_i
      @code.tr("BF", "10").to_i(2)
    end
  end

  class ColumnPosition
    def initialize(code)
      @code = code.slice(7, 3)
    end

    def to_i
      @code.tr("RL", "10").to_i(2)
    end
  end
end
