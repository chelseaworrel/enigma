require './test/test_helper'
require './lib/crackor'

class CrackorTest < Minitest::Test
  def test_it_exists
    assert Crackor.new("041415", "48ax")
  end

  def test_the_ultimate_prize
    crack = Crackor.new("041415", "6uv8kv5nn0ku0p4b26v3tkzqpuv3rllu0qlo")
    assert_equal "11111", crack.crack_file
  end

  def test_another_version_of_crack
    crack = Crackor.new("020315", "48ax2.qljptaopn")
    assert_equal "41521", crack.crack_file
  end

  def test_and_keep_on_testing_that_it_cracks
    crack = Crackor.new("041415", "6uv8k5uy6kv8kp14yllu0qlo")
    assert_equal "11111", crack.crack_file
  end

  def test_and_keep_on_testing_that_it_cracks_yet_again
    crack = Crackor.new("030415", "4dili2bl2g97kz1ly635kiy0khgom6zmkc4me")
    assert_equal "82648", crack.crack_file
  end
end
