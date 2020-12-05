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
      @rows = (0..127).to_a
    end

    def to_i
      @code.chars.reduce(@rows) do |rows, char|
        if char == 'F'
          rows.slice!((rows.length - rows.length / 2), rows.length)
        elsif char == 'B'
          rows.slice!(0, (rows.length - rows.length / 2))
        end

        rows
      end.first
    end
  end

  class ColumnPosition
    def initialize(code)
      @code = code.slice(7, 3)
      @cols = (0..7).to_a
    end

    def to_i
      @code.chars.reduce(@cols) do |rows, char|
        if char == 'L'
          rows.slice!((rows.length - rows.length / 2), rows.length)
        elsif char == 'R'
          rows.slice!(0, (rows.length - rows.length / 2))
        end

        rows
      end.first
    end
  end
end
