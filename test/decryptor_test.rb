require './test/test_helper'
require './lib/decryptor'

class DecryptorTest < Minitest::Test
  def test_it_exists
    assert Decryptor.new("11111", "041415", "a")
  end

  def test_it_can_group_letters
    assert_equal [["t"]], Decryptor.new("11111", "041415", "t").split_letters
    encrypt = Decryptor.new("11111", "041415", "mm1 rd6h")
    assert_equal [["m", "m", "1", " "], ["r", "d", "6", "h"]], encrypt.split_letters
  end

  def test_it_can_find_the_grouped_letters_index_on_the_character_map
    assert_equal [[0]], Decryptor.new("41521", "020315", "a").index_on_map
    assert_equal [[0, 1]], Decryptor.new("11111", "041415", "ab").index_on_map
    assert_equal [[30, 34, 0]], Decryptor.new("11111", "041415", "48a").index_on_map
  end

  def test_it_can_return_an_array_that_subtracts_the_index_on_the_char_map_and_your_rotation_indices
    assert_equal [[-50]], Decryptor.new("41521", "020315", "a").encrypted_message_rotation_combo
    assert_equal [[-13, -12]], Decryptor.new("11111", "041415", "ab").encrypted_message_rotation_combo
    assert_equal [[17, 21, -13]], Decryptor.new("11111", "041415", "48a").encrypted_message_rotation_combo
  end

  def test_that_if_your_rotation_indices_plus_the_indices_on_the_char_map_is_greater_than_the_map_can_still_work
    assert_equal [[8]], Decryptor.new("41521", "020315", "t").keep_within_char_map
  end

  def test_it_can_encrypt_one_character
    assert_equal "a", Decryptor.new("11111", "041415", "n").return_encrypting_chars
    assert_equal "c", Decryptor.new("11111", "041415", "p").return_encrypting_chars
    assert_equal "f", Decryptor.new("11111", "041415", "s").return_encrypting_chars
  end

  def test_it_can_encrypt_4_characters
    assert_equal "abcf", Decryptor.new("11111", "041415", "nopv").return_encrypting_chars
    assert_equal "abcu", Decryptor.new("11111", "041415", "nop ").return_encrypting_chars
    assert_equal "cbaa", Decryptor.new("11111", "041415", "ponq").return_encrypting_chars
  end

  def test_it_can_encrypt_4_characters_with_a_rotation_outside_of_the_char_map
    assert_equal "try ", Decryptor.new("41521", "020315", "48ax").return_encrypting_chars
    assert_equal "trab", Decryptor.new("41521", "020315", "48p1").return_encrypting_chars
    assert_equal "ruby", Decryptor.new("41521", "020315", "2.ql").return_encrypting_chars
  end

  def test_it_can_encrypt_more_than_one_word
    assert_equal "try ruby", Decryptor.new("41521", "020315", "48ax2.ql").return_encrypting_chars
    assert_equal "try rub ", Decryptor.new("41521", "020315", "48ax2.qx").return_encrypting_chars
    assert_equal "try ruby", Decryptor.new("11111", "041415", "64.n47ob").return_encrypting_chars
    assert_equal "try rub ", Decryptor.new("11111", "041415", "64.n47on").return_encrypting_chars
  end

  def test_ultimate_whammy
    encrypt = Decryptor.new("11111", "041415","6uv8kv5nn0ku0p4b26v3tkzqpuv3r")
    assert_equal "this is an encrypting machine", encrypt.return_encrypting_chars
  end
end
