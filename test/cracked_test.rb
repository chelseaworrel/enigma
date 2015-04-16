require './test/test_helper'
require './lib/cracked'

class CrackedTest < Minitest::Test
  def test_it_exists
    assert Cracked.new("041415", "48ax")
  end

  def test_the_ultimate_prize
    crack = Cracked.new("041415", "6uv8kv5nn0ku0p4b26v3tkzqpuv3rllu0qlo")
    assert_equal "11111", crack.crack_file
  end

  def test_another_version_of_crack
    crack = Cracked.new("020315", "48ax2.qljptaopn")
    assert_equal "41521", crack.crack_file
  end
end
