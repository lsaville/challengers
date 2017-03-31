require 'minitest/autorun'
require './in_flight_entertainment'

class TestInFlightEntertainment < Minitest::Test
  def test_it_exists
    meow = InFlightEntertainment.new

    assert_equal meow.class, InFlightEntertainment
  end
end
