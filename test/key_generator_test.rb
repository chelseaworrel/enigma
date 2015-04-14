require './test/test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_it_exists
    assert KeyGenerator.new
  end
  #ask Horace if this test is working:
  def test_it_can_create_a_new_key_with_a_random_value
    key = KeyGenerator.generate
    result = []
     10.times do
      result << KeyGenerator.generate
    end
    assert result.uniq
  end
end
