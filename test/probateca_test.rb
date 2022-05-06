# encoding: UTF-8
#
require 'probateca'
require 'test/unit'

class ProbatecaTest < Test::Unit::TestCase
  def setup
    @mega   = "test/fixtures/results.megasena"
    @quina  = "test/fixtures/results.quina"
  end

  def test_count_total_of_mega_sena
    result   = Probateca.parse(@mega)
    expected = {}
    1.upto(60) do |n|
      expected[n] = 0
    end

    expected[41] = 2
    expected[5 ] = 1
    expected[4 ] = 1
    expected[52] = 1
    expected[30] = 1
    expected[33] = 1
    expected[9 ] = 1
    expected[39] = 1
    expected[37] = 1
    expected[49] = 1
    expected[43] = 1

    assert_equal expected, result
  end

  def test_count_total_of_quina
    result = Probateca.parse(@quina)
    expected = {}
    1.upto(80) do |n|
      expected[n] = 0
    end

    expected[25] = 1
    expected[45] = 1
    expected[60] = 1
    expected[76] = 1
    expected[79] = 1
    expected[13] = 1
    expected[30] = 1
    expected[58] = 1
    expected[63] = 1
    expected[64] = 1

    assert_equal expected, result
  end
end
