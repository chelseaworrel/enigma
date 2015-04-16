require './lib/encryptor'

infile  = ARGV[0] || "message.txt"
outfile = ARGV[1] || "encrypted.txt"

message = File.open(infile, "r"){ |file| file.read }.chomp.to_s

key      = KeyGenerator.generate
date_key = DateKey.new.today

flappy   = Encryptor.new(key, date_key, message)

CRAP = flappy.return_encrypting_chars

File.open(outfile, "w") { |file| file.write(CRAP) }

puts "Created 'encrypted.txt' with the key #{key} and date #{date_key}"
