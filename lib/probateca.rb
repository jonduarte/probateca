require 'date'

module Probateca
  @parsers = {}

  def self.register(game, parser)
    @parsers[game] = parser
  end

  def self.parse(file)
    game = File.extname(file).split(".")[1]
    @parsers[game].new(file).parse_file
  end

  class Parser
    def initialize(file)
      @file = File.read(file)
    end

    def lines
      result = @file.split("\n")
      result.shift
      result
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

  class MegaSenaParse < Parser
    def initialize(file)
      super file
      @numbers = {}
      1.upto(60) do |n|
        @numbers[n] = 0
      end
    end
    def extract_numbers(line)
      line.split("|").slice(2, 6).collect(&:to_i)
    end
  end
  Probateca.register "mega_sena", MegaSenaParse

  class QuinaParse < Parser
    def initialize(file)
      super file
      @numbers = {}
      1.upto(80) do |n|
        @numbers[n] = 0
      end
    end

    def extract_numbers(line)
      line.split("|").slice(2, 5).collect(&:to_i)
    end
  end
  Probateca.register "quina", QuinaParse
end
