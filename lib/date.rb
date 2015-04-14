class Date
  attr_reader :date

  def initialize(date = Time.now.strftime("%m%d%y"))
     @date = date
   end

  def square_the_date
    @date.to_i ** 2
  end

  def last_four_digits

  end

end

# Date class:

# The date of message transmission is also factored into the encryption
# Consider the date in the format DDMMYY, like 020315
# Square the numeric form (412699225) and find the last four digits (9225)

#Offsets class:

# The first digit is the "A offset" (9)
# The second digit is the "B offset" (2)
# The third digit is the "C offset" (2)
# The fourth digit is the "D offset" (5)
# example of sample code
#def key_rotation_a
#   @key[0..1].to_i
# end
