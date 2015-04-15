require './lib/rotation'

class Encryptor
  attr_reader :rotation, :message

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(key, date_key, message)
    @rotation = Rotation.new(key, date_key).rotators
    @message  = message
  end

  def split_letters #message chunked into groups of 4 characters
    # @message.chars
     @message.chars.each_slice(4).to_a
  end

  def index_on_map
    # require 'pry' ; binding.pry
    # [['t','r','y',' '], ['r', 'u', 'b', 'y']]
    split_letters.map do |group|
      group.map do |letter|
        CHAR_MAP.find_index(letter)
      end
    end
  end

  def message_rotation_combo
    index_on_map.map do |group|
      group.zip(@rotation).map { |nums| nums.reduce(:+) }
    end
  end


  def flappy
    message_rotation_combo.map do |group|
      group.map do |index|
        index % 39
      end
    end
  end

  def return_encrypting_chars
    flappy.map do |group|
      group.map do |index|
         CHAR_MAP[index]
       end
     end.join
  end

end
