require './lib/decryptor'

infile  = ARGV[0] || "encrypted.txt"
outfile = ARGV[1] || "decrypted.txt"

message = File.open(infile, "r"){ |file| file.read }.chomp.to_s

key      = KeyGenerator.generate
date_key = DateKey.new.today

flappy   = Decryptor.new(key, date_key, message)

CRAP = flappy.return_encrypting_chars

File.open(outfile, "w") { |file| file.write(CRAP) }

puts "Created 'decrypted.txt' with the key #{key} and date #{date_key}"
