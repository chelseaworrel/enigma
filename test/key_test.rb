require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists
    assert Key.new
  end
end
