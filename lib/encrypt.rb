require './lib/encryptor'

infile  = ARGV[0] || "message.txt"
outfile = ARGV[1] || "encrypted.txt"

message = File.read(infile).split("\n").join

key               = KeyGenerator.generate
date_key          = DateKey.new.today
encrypt           = Encryptor.new(key, date_key, message)
encrypted_message = encrypt.return_encrypting_chars

File.open(outfile, "w") { |file| file.write(encrypted_message) }
# File.write(outfile).write(encrypted_message)
puts "Created 'encrypted.txt' with the key #{key} and date #{date_key}"
