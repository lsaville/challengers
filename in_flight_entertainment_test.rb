require 'minitest/autorun'
require './in_flight_entertainment'

class TestInFlightEntertainment < Minitest::Test
  def test_it_exists
    meow = InFlightEntertainment.new(123, [34,53])
    assert_equal meow.class, InFlightEntertainment
  end

  def test_it_returns_true_given_two_values_that_equal_flight_length
    meow = InFlightEntertainment.new(100, [40,60])

    assert meow.two_movies_fit?
  end
end
