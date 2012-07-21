require 'date'

class Probateca
  def initialize(file)
    @file = File.read(file)
    @numbers = Hash.new(0)
  end

  def lines
    result = @file.split("\n")
    result.shift
    result
  end

  def extract_numbers(line)
    line.split("|").slice(2, 6).collect(&:to_i)
  end

  def parse_file
    lines.each do |line|
      extract_numbers(line).each do |n|
        @numbers[n] += 1
      end
    end
    @numbers
  end
end
