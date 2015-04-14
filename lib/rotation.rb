require './lib/date_key'
require './lib/key'

class Rotation
  attr_reader :key, :date_key

  def initialize(key, date_key)
    @key = key
    @date_key = date_key
  end

  def offsets
    offsets = @date_key.date_offsets.zip(@key.key_offsets)
      offsets.map do |offset|
        offset.reduce(:+)
      end
  end
  #need to take date_offsets
  #and the key_offsets and sum them
  #to create the rotation that will be
  #used in the rotator class
#needs a key
#needs a date_key
#needs to get their offsets and
#combine them somehow
#needs to product its own offsets
end
