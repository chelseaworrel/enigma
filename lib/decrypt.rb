require './lib/decryptor'

infile   = ARGV[0] || "encrypted.txt"
outfile  = ARGV[1] || "decrypted.txt"
key      = ARGV[2]
date_key = ARGV[3]

message  = File.read(infile).split("\n").join

# key               = KeyGenerator.generate
# date_key          = DateKey.new.today
decrypt           = Decryptor.new(key, date_key, message)
decrypted_message = decrypt.return_encrypting_chars

File.open(outfile, "w") { |file| file.write(decrypted_message) }

puts "Created 'decrypted.txt' with the key #{key} and date #{date_key}"
