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
    #needs to return an array of 4 numbers so it
    #can combine with key offsets
  end

end

# Date class:

# The date of message transmission is also factored into the encryption
# Consider the date in the format DDMMYY, like 020315
# Square the numeric form (412699225) and find the last four digits (9225)

#will need to zip the key_offsets
#and the date_offsets !!!
