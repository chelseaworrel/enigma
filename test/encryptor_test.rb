require './test/test_helper'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_exists
    assert Encryptor.new("11111", "041415", "a")
  end

  def test_it_can_encrypt_one_character
    assert_equal "n", Encryptor.new("11111", "041415", "a").return_encrypting_chars
    assert_equal "p", Encryptor.new("11111", "041415", "c").return_encrypting_chars
    assert_equal "s", Encryptor.new("11111", "041415", "f").return_encrypting_chars
  end

  def test_ultimate_whammy_for_one_letter
    assert_equal "4", Encryptor.new("41521", "020315", "t").return_encrypting_chars
    assert_equal " ", Encryptor.new("41521", "020315", "z").return_encrypting_chars
  end

  def test_it_can_encrypt_4_characters
    assert_equal "nopv", Encryptor.new("11111", "041415", "abcf").return_encrypting_chars
    assert_equal "nop ", Encryptor.new("11111", "041415", "abcu").return_encrypting_chars
    assert_equal "ponq", Encryptor.new("11111", "041415", "cbaa").return_encrypting_chars
  end

  def test_ultimate_whammy_of_all_whammies
    assert_equal "48ax", Encryptor.new("41521", "020315", "try ").return_encrypting_chars
    assert_equal "48p1", Encryptor.new("41521", "020315", "trab").return_encrypting_chars
  end

end
