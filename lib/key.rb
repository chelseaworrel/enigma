require './lib/key_generator'

class Key
  attr_reader :key
  def initialize(key = KeyGenerator.generate)
    @key = key
  end

  def offsets
    @key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

#don't know if I will need the following, delete if not needed:

  def key_rotation_a
    @key[0..1].to_i
  end

  def key_rotation_b
    @key[1..2].to_i
  end

  def key_rotation_c
    @key[2..3].to_i
  end

  def key_rotation_d
    @key
  end

end



#need something like:
#Key.generate -> new Key with random value`; `Key.new(41521).rotations -> [41,15,52,21]

#does key need to hold a character map?
#need a key_rotation_a and b,c,d methods
#is it being passed in as a string?
