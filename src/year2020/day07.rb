module Year2020
  class Day07
    def part1(input)
      input.each do |string|
        color, capacity = string.split(" bags contain ")
        bag = Bag.find_or_initialize(color)

        capacity.split(", ").each do |container|
          /^(?<number>\d+)\s(?<bag_color>.+)\sbag/ =~ container
          next if number.nil?

          descendant = Bag.find_or_initialize(bag_color)
          bag.add(descendant)
        end
      end

      Bag.bags.count do |key, bag|
        bag.summation > 0
      end
    end

    def part2(input)
      input.each do |string|
        color, capacity = string.split(" bags contain ")
        bag = Bag.find_or_initialize(color)

        capacity.split(", ").each do |container|
          /^(?<number>\d+)\s(?<bag_color>.+)\sbag/ =~ container
          next if number.nil?

          number.to_i.times do
            descendant = Bag.find_or_initialize(bag_color)
            bag.add(descendant)
          end
        end
      end

      Bag.find_or_initialize("shiny gold").descendants_count
    end

    def parse(input)
    end
  end

  class Bag
    attr_reader :color, :capacity
    @bags = {}

    def self.find_or_initialize(color)
      return @bags[color] if @bags.has_key?(color)

      @bags[color] = Bag.new(color)
    end

    def self.bags
      @bags
    end

    def initialize(color)
      @color     = color
      @capacity  = []
    end

    def add(bag)
      @capacity << bag
    end

    def summation
      @capacity.reduce(0) do |memo, bag|
        memo += 1 if bag.color == "shiny gold"
        memo += bag.summation
        memo
      end
    end

    def descendants_count
      @capacity.reduce(0) do |memo, bag|
        memo += 1
        memo += bag.descendants_count
        memo
      end
    end

    def to_s
      "#{color} bags contain #{capacity.map(&:color)}"
    end
  end
end
