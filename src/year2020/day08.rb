module Year2020
  class Day08
    def part1(input)
      ribbon = Ribbon.new(input)
      ribbon.forward until ribbon.ran_position_already?
      ribbon.accumulator
    end

    def part2(input)
      (input.length - 1).downto(0) do |index|
        ribbon = Ribbon.new(input.dup)

        ribbon.toggle_line_command(index)

        ribbon.forward until ribbon.ran_position_already? || ribbon.ran_out_of_tape?

        return ribbon.accumulator if ribbon.ran_out_of_tape?
      end
    end
  end

  class Ribbon
    attr_reader :lines, :position, :accumulator, :length

    def initialize(lines)
      @lines       = lines
      @position    = 0
      @accumulator = 0
      @flags       = Hash.new(false)
    end

    def toggle_line_command(index)
      line = @lines[index]

      if line.start_with?("jmp")
        @lines[index] = line.gsub("jmp", "nop")
      elsif line.start_with?("nop")
        @lines[index] = line.gsub("nop", "jmp")
      end
    end

    def forward
      /(?<command>\w{3})\s(?<value>[\+|\-]\d+)/ =~ @lines[@position]

      value = value.to_i

      @flags[@position] = :ran

      case command
      when "jmp"
        @position += value
      when "acc"
        @accumulator += value
        @position += 1
      else
        @position += 1
      end

      true
    end

    def ran_position_already?
      @flags.has_key?(@position)
    end

    def ran_out_of_tape?
      @position == @lines.length
    end

    def length
      @lines.length
    end
  end
end
