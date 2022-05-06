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
    attr_reader :file

    def initialize(file, total)
      @file = File.read(file)
      @numbers = {}
      1.upto(total) { |n| @numbers[n] = 0 }
    end

    def lines
      file.split("\n").drop(1)
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
      super file, 60
    end

    def extract_numbers(line)
      line.split("\t").slice(2, 6).collect(&:to_i)
    end
  end
  Probateca.register "megasena", MegaSenaParse

  class QuinaParse < Parser
    def initialize(file)
      super file, 80
    end

    def extract_numbers(line)
      line.split("\t").slice(2, 5).collect(&:to_i)
    end
  end
  Probateca.register "quina", QuinaParse
end
