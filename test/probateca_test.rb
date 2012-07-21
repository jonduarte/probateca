# encoding: UTF-8
#
require 'probateca'
require 'test/unit'

class ProbatecaTest < Test::Unit::TestCase
  def setup
    @mega   = "test/fixtures/mega_sena_simple.mega_sena"
    @quina  = "test/fixtures/quina_simple.quina"
  end

  def test_count_total_of_mega_sena
    result   = Probateca.parse(@mega)
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

  def test_count_total_of_quina
    result = Probateca.parse(@quina)
    expected = { 
      25 => 1,
      45 => 1,
      60 => 1,
      76 => 1,
      79 => 1,
      13 => 1,
      30 => 1,
      58 => 1,
      63 => 1,
      64 => 1
    }
    assert_equal expected, result
  end
end
