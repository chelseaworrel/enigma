require './test/test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_it_exists
    assert KeyGenerator.new
  end

  def test_it_can_create_a_new_key_with_a_random_values
    key = KeyGenerator.generate
    assert_equal 5, KeyGenerator.generate.length
  end

end
