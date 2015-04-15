require './test/test_helper'
require './lib/rotation'
require './lib/key'
require './lib/date_key'

class RotationTest < Minitest::Test
  def test_it_exists
    assert Rotation.new("11111", "041415")
  end

  def test_it_instantiates_a_new_instance_of_key
    assert Key.new("12345")
  end

  def test_it_instantiates_a_new_instance_of_date_key
    assert DateKey.new("041415")
  end

  def test_it_can_create_a_rotation_value
    rotation = Rotation.new("11111", "041415")
    assert_equal [13,13,13,16], rotation.rotators
  end

  def test_it_can_create_a_rotation_value_again
    rotation = Rotation.new("41521", "020315")
    assert_equal [50, 17, 54, 26], rotation.rotators
  end
end
