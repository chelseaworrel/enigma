class KeyGenerator

  KEY_SELECTION = Array(0..9)

  def self.generate
    5.times.collect do
      KEY_SELECTION.sample
    end.join
  end
end
