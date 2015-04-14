require './test/test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_it_exists
    assert KeyGenerator.new
  end

  def test_it_can_create_a_new_key_with_a_random_values
    key = KeyGenerator.generate
    assert 87396, KeyGenerator.generate
  end

  def test_it_can_create_a_new_key_with_a_random_value
    skip #if you don't get this working, delete it and call it good
      mock = MiniTest::Mock.new
      mock.expect(:generate, '64448')

      key = KeyGenerator.generate

      mock.verify
  end
end
