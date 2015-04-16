require './lib/rotation'
require './lib/decryptor'

class Cracked
  attr_reader   :date_key, :encrypted_message
  attr_accessor :key

  def initialize(date, encrypted_message = "..end..")
    @date              = date
    @encrypted_message = encrypted_message
    @key               = "00000"
    @modified_message  = encrypted_message
  end

  def crack_file
    until confirmed_decrypted?
      decryptor = Decryptor.new(@key, @date, @encrypted_message)
      @modified_message = decryptor.return_encrypting_chars
      @key = (@key.to_i + 1).to_s.rjust(5, "0")
    end
    (@key.to_i - 1).to_s
  end

  def confirmed_decrypted?
    matching_phrase = "..end.."
    @modified_message[-7..-1] == matching_phrase
  end
end
