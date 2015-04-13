require './test/test_helper'
require './lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_exists
    assert Encrypt.new
  end
end
