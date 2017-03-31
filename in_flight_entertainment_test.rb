require 'minitest/autorun'
require './in_flight_entertainment'

class TestInFlightEntertainment < Minitest::Test
  def test_it_exists
    flight = InFlightEntertainment.new(123, [34,53])
    assert_equal flight.class, InFlightEntertainment
  end

  def test_it_returns_true_given_two_values_that_equal_flight_length
    flight = InFlightEntertainment.new(100, [40,60])

    assert flight.two_movies_fit?
  end

  def test_it_returns_false_given_the_same_movie_twice
    flight = InFlightEntertainment.new(100, [50,50])

    refute flight.two_movies_fit?
  end
end
