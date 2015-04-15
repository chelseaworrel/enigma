require './test/test_helper'
require './lib/rotation'
require './lib/key'
require './lib/date_key'

class RotationTest < Minitest::Test
  def test_it_exists
    assert Rotation.new("11111", "041415")
  end

  def test_it_can_create_a_rotation_value
    key = Key.new("11111")
    date_key = DateKey.new("041415")
    rotation = Rotation.new("11111", "041415").rotators
    assert_equal [13,13,13,16], rotation
  end

end
