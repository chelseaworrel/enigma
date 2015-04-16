require './test/test_helper'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_exists
    assert Encryptor.new("11111", "041415", "a")
  end

  def test_it_can_group_letters
    assert_equal [["t"]], Encryptor.new("11111", "041415", "t").split_letters
    encrypt = Encryptor.new("11111", "041415", "try ruby")
    assert_equal [["t", "r", "y", " "], ["r", "u", "b", "y"]], encrypt.split_letters
  end

  def test_it_can_find_the_grouped_letters_index_on_the_character_map
    assert_equal [[0]], Encryptor.new("41521", "020315", "a").index_on_map
    assert_equal [[0, 1]], Encryptor.new("11111", "041415", "ab").index_on_map
    assert_equal [[7, 4, 24]], Encryptor.new("11111", "041415", "hey").index_on_map
  end

  def test_it_can_return_an_array_that_adds_together_the_index_on_the_char_map_and_your_rotation_indices
    assert_equal [[50]], Encryptor.new("41521", "020315", "a").message_rotation_combo
    assert_equal [[13, 14]], Encryptor.new("11111", "041415", "ab").message_rotation_combo
    assert_equal [[32, 30, 37]], Encryptor.new("11111", "041415", "try").message_rotation_combo
  end

  def test_that_if_your_rotation_indices_plus_the_indices_on_the_char_map_is_greater_than_the_map_can_still_work
    assert_equal [[30]], Encryptor.new("41521", "020315", "t").keep_within_char_map
  end

  def test_it_can_encrypt_one_character
    assert_equal "n", Encryptor.new("11111", "041415", "a").return_encrypting_chars
    assert_equal "p", Encryptor.new("11111", "041415", "c").return_encrypting_chars
    assert_equal "s", Encryptor.new("11111", "041415", "f").return_encrypting_chars
  end

  def test_one_letter_when_rotation_is_outside_of_the_char_map
    assert_equal "4", Encryptor.new("41521", "020315", "t").return_encrypting_chars
    assert_equal " ", Encryptor.new("41521", "020315", "z").return_encrypting_chars
  end

  def test_it_can_encrypt_4_characters
    assert_equal "nopv", Encryptor.new("11111", "041415", "abcf").return_encrypting_chars
    assert_equal "nop ", Encryptor.new("11111", "041415", "abcu").return_encrypting_chars
    assert_equal "ponq", Encryptor.new("11111", "041415", "cbaa").return_encrypting_chars
  end

  def test_it_can_encrypt_4_characters_with_a_rotation_outside_of_the_char_map
    assert_equal "48ax", Encryptor.new("41521", "020315", "try ").return_encrypting_chars
    assert_equal "48p1", Encryptor.new("41521", "020315", "trab").return_encrypting_chars
    assert_equal "48p1", Encryptor.new("41521", "020315", "trab").return_encrypting_chars
    assert_equal "2.ql", Encryptor.new("41521", "020315", "ruby").return_encrypting_chars
  end

  def test_it_can_encrypt_more_than_one_word
    assert_equal "48ax2.qljptaopn", Encryptor.new("41521", "020315", "try ruby..end..").return_encrypting_chars
    assert_equal "48ax2.qx", Encryptor.new("41521", "020315", "try rub ").return_encrypting_chars
    assert_equal "64.n47ob", Encryptor.new("11111", "041415", "try ruby").return_encrypting_chars
    assert_equal "64.n47on", Encryptor.new("11111", "041415", "try rub ").return_encrypting_chars
  end

  def test_ultimate_whammy
    encrypt = Encryptor.new("11111", "041415", "this is an encrypting machine..end..")
    assert_equal "6uv8kv5nn0ku0p4b26v3tkzqpuv3rllu0qlo", encrypt.return_encrypting_chars
  end
end
