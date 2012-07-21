# encoding: UTF-8
#
require 'probateca'
require 'test/unit'

class ProbatecaTest < Test::Unit::TestCase
  def setup
    @file = "test/fixtures/mega_sena_simple.txt"
  end

  def test_can_retrieve_total_of_numbers
    result   = Probateca.new(@file).parse_file
    expected = {
      41 => 2,
      5  => 1,
      4  => 1,
      52 => 1,
      30 => 1,
      33 => 1,
      9  => 1,
      39 => 1,
      37 => 1,
      49 => 1,
      43 => 1,
    }
    assert_equal expected, result
  end
end
