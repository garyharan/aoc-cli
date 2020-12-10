module Year2020
  class Day10
    def part1(input)
      adapters = parse(input)
      adapters = chain_from_wall_to_device(adapters)

      product differences(adapters)
    end

    def part2(input)
      adapters = [wall = 0] + parse(input)

      paths(adapters)
    end

    def paths(input)
      paths = input.reduce({}) do |acc, adapter|
        acc[adapter] = input.select do |link|
          link.between?(adapter + 1, adapter + 3)
        end

        acc
      end

      count_paths(paths, 0, {})
    end

    def count_paths(graph, index, cache)
      return cache[index] unless cache[index].nil?
      return 1 if graph[index].count == 0

      graph[index].reduce(0) do |acc, hop|
        acc += cache[hop] = count_paths(graph, hop, cache)
      end
    end

    def product(input)
      input.count(1) * input.count(3)
    end

    def parse(input)
      input.map(&:to_i).sort
    end

    def differences(joltages)
      joltages.each.with_index.inject([]) do |acc, (joltage, index)|
        if index == 0
          acc
        else
          acc << joltage - joltages[index - 1]
        end

        acc
      end
    end

    def chain_from_wall_to_device(joltages)
      wall   = 0
      device = joltages.last + 3

      [wall] + joltages + [device]
    end
  end
end

