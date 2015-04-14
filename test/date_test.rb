require './test/test_helper'
require './lib/date'

class DateTest < Minitest::Test
  def test_it_exists
    assert Date.new
  end

  def test_it_can_store_the_date
    date = Date.new
    assert_equal "041415", date.date
  end

  def test_it_can_square_the_date
    date = Date.new
    assert_equal 1715202225, date.square_the_date
  end
  
end

#must change your date values the day your project is due
#to refelect current date and current date squared values
