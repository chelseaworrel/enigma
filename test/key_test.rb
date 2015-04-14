require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists
    assert Key.new("12345")
  end

  def test_it_can_generate_a_random_key_and_identify_rotation_a
    key = Key.new
    assert_equal 2, key.key_rotation_a.to_s.length
  end

  def test_it_can_join_the_offsets
    key = Key.new("12345")
    assert_equal [12, 23, 34, 45], key.offsets
  end

  def test_it_can_identify_rotation_a
    key = Key.new("12345")
    assert_equal 12, key.key_rotation_a
  end

  def test_it_can_identify_rotation_b
    key = Key.new("12345")
    assert_equal 23, key.key_rotation_b
  end

  def test_it_can_identify_rotation_c
    key = Key.new("12345")
    assert_equal 34, key.key_rotation_c
  end

  def test_it_can_identify_rotation_d
    key = Key.new("12345")
    assert_equal 45, key.key_rotation_d
  end
  
end
