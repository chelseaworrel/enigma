require './lib/cracked'

infile  = ARGV[0] || "encrypted.txt"
outfile = ARGV[1] || "cracked.txt"
date    = ARGV[2]

encrypted_message = File.read(infile).split("\n").join

cracker = Cracked.new(date, encrypted_message)
key     = cracker.crack_file
cracked_message = cracker.modified_message

File.open(outfile, "w") { |file| file.write(cracked_message) }

puts "Created 'cracked.txt' with the key #{key} and date #{date}"
