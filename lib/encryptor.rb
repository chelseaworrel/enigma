require './lib/rotation'

class Encryptor
  attr_reader :rotation, :message

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(key, date_key, message)
    @rotation = Rotation.new(key, date_key).rotators
    @message  = message
  end

  def split_letters
    @message.chars.each_slice(4).to_a.flatten

  end

  def position_on_map
    split_letters.map {|letter| CHAR_MAP.find_index(letter)}
  end

  def message_rotation_combo
    position_on_map.zip(@rotation).map {|nums| nums.reduce(:+)}
  end


  def flappy
    message_rotation_combo.map { |index| index >= 39 ? index % 39 : index }
  end

  def return_encrypting_chars
    flappy.map { |index| CHAR_MAP[index] }.join
  end

end
