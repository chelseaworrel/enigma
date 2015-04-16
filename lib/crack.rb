require './lib/cracked'

infile  = ARGV[0] || "encrypted.txt"
outfile = ARGV[1] || "cracked.txt"
date    = ARGV[2]

encrypted_message = File.read(infile).split("\n").join
flappy = Cracked.new(date, encrypted_message)

key = flappy.crack_file
crap = flappy.modified_message

File.open(outfile, "w") { |file| file.write(crap) }

puts "Created 'cracked.txt' with the key #{key} and date #{date}"
#this is not working...
