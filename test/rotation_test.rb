require './test/test_helper'
require './lib/rotation'
require './lib/key'
require './lib/date_key'

class RotationTest < Minitest::Test
  def test_it_exists
    assert Rotation.new("41521", "020315")
  end

  def test_it
    key = Key.new("41521")
    date_key = DateKey.new("020315")
    rotation = Rotation.new(key, date_key).offsets
    assert_equal [50,17,54,26], rotation
  end

end
