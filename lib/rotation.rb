require './lib/date_key'
require './lib/key'

class Rotation

  def initialize(key, date_key)
    @key      = Key.new(key)
    @date_key = DateKey.new(date_key)
  end

  def rotators
    offsets = @date_key.date_offsets.zip(@key.key_offsets)
    offsets.map do |offset|
      offset.reduce(:+)
    end
  end
end
