require './lib/cracked'

infile  = ARGV[0] || "encrypted.txt"
outfile = ARGV[1] || "cracked.txt"
date    = ARGV[2]

encrypted_message = File.open(infile, "r"){ |file| file.read }.chomp.to_s

flappy = Cracked.new(date, encrypted_message)

CRAP = flappy.crack_file

File.open(outfile, "w") { |file| file.write(CRAP) }

# puts "Created 'cracked.txt' with the key #{key} and date #{date_key}"
#this is not working...
