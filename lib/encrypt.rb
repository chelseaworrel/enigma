require './lib/encryptor'
require './lib/rotation'

class Encrypt

end



# attr_reader :message
#
# def initialize(message)
#   @message = message
#   # @encrypted_message = []
#   # @rotation = rotation
# end

# @message   = File.read(ARGV[0]) #not sure about this
# encrypted = ARGV[1]
# date_key  = ARGV[2]
# key       = ARGV[3]

# puts "Created 'encrypted.txt' with the key #{key} and date #{date_key}"

# puts "Incoming message is #{message}"
# puts "Encrypted message is #{encrypted}"
# puts "Date key is #{date_key}"
# puts "Key is #{key}"

#not sure where you belong: currenlty in encryptor
#   CHARACTER_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]
#
#
# def split_letters
#   message.chars.each_slice(4).to_a
#   #returns two arrays within an array
# end
#
#
#
# def encrypt(message) #maybe map_with_index?
#   split_letters(message).each do |something|
#     something.each_with_index do |letter, index|
#       x = CHARACTER_MAP.index(letter) + rotation[index]
#       new_idex = x % 39
#       encrypted_message << CHARACTER_MAP[new_index]
#     end
#   end


#take the message and break it into 4 characters in the array
#message => "try ruby"
  # => ["t","r","y", " "] ["r","u","b","y"]
# => compare to char map...
#compare to offsets array: [A,B,C,D]
