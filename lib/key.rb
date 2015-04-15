require './lib/key_generator'

class Key
  attr_reader :key

  def initialize(key = KeyGenerator.generate)
    @key = key
  end

  def key_offsets
    @key.chars.each_cons(2).map(&:join).map(&:to_i)
  end
end
