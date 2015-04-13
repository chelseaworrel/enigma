require './test/test_helper'
require './lib/decrypt'

class DecryptTest < Minitest::Test
  def test_it_exists
    assert Decrypt.new
  end
end
