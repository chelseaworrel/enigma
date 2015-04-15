require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists
    assert Key.new("12345")
  end

  def test_it_can_join_the_offsets
    assert_equal [12, 23, 34, 45], Key.new("12345").key_offsets
    assert_equal [11, 11, 11, 11], Key.new("11111").key_offsets
    assert_equal [41, 15, 52, 21], Key.new("41521").key_offsets
    assert_equal [12, 29, 98, 87], Key.new("12987").key_offsets
    assert_equal [0, 0, 0, 0], Key.new("00000").key_offsets
  end
end
