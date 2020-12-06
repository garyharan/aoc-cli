module Year2020
  class Day06
    def part1(input)
      input.map do |s|
        s.chars.reject(& -> (c) { c == "\n" }).uniq
      end.map(&:length).sum
    end

    def part2(input)
      input.map do |group|
        group_size = group.split("\n").count

        group.chars.reduce(Hash.new(0)) do |hash, char|
          hash.store(char, hash[char] + 1) unless char == "\n"
          hash
        end.select do |key, value|
          value == group_size
        end.length

      end.sum
    end
  end
end
