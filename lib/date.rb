class Date
  attr_reader :date

  def initialize(date = Time.now.strftime("%m%d%y"))
     @date = date
     #@date is nil...needs to be "041315"
   end

  def square_the_date
    @date.to_i ** 2
  end
  #why the fuck doesn't this work?

#need date to be DDMMYY format
  # =>  Time.now.strftime("%m%d%y")
  #this is not actually parsing...

end

# The Offsets
#
# The date of message transmission is also factored into the encryption
# Consider the date in the format DDMMYY, like 020315
# Square the numeric form (412699225) and find the last four digits (9225)
# The first digit is the "A offset" (9)
# The second digit is the "B offset" (2)
# The third digit is the "C offset" (2)
# The fourth digit is the "D offset" (5)
