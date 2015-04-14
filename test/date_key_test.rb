require './test/test_helper'
require './lib/date_key'

class DateKeyTest < Minitest::Test
  def test_it_exists
    assert DateKey.new
  end

  def test_it_can_store_the_date
    date = DateKey.new
    assert_equal "041415", date.date
  end

  def test_it_can_square_the_date
    date = DateKey.new
    assert_equal 1715202225, date.square_the_date
  end
  
  def test_it_takes_last_four_digits_for_offsets
    date = DateKey.new
    assert_equal [2,2,2,5], date.date_offsets
  end

end

#must change your date values the day your project is due
#to refelect current date and current date squared values