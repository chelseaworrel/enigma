class DateKey
  attr_reader :date

  def initialize(date = today) 
    @date = date
  end

  def today
    date = Time.now.strftime("%m%d%y")
  end

  def square_the_date
    @date.to_i ** 2
  end

  def date_offsets
    square_the_date.to_s.chars.last(4).map(&:to_i)
  end
end
