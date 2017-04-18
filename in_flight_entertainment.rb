# You've built an in-flight entertainment system with on-demand movie streaming.
#
# Users on longer flights like to start a second movie right when their first
# one ends, but they complain that the plane usually lands before they can see
# the ending. So you're building a feature for choosing two movies whose total
# runtimes will equal the exact flight length.
#
# Write a function that takes an integer flight_length (in minutes) and an
# array of integers movie_lengths (in minutes) and returns a boolean indicating
# whether there are two numbers in movie_lengths whose sum equals flight_lenght.
#
# When building your function:
# -Assume your users will watch exactly two movies.
# -Don't make your users watch the same movie twice.
# -Optimize for runtime over memory.

class InFlightEntertainment
  attr_reader :flight_length, :movie_lengths

  def initialize(flight_length, movie_lengths)
    @flight_length = flight_length
    @movie_lengths = movie_lengths
  end

  def two_movies_fit? 
    @movie_lengths.any? do |first_length|
      compare_with_others(first_length)
    end
  end

  def compare_with_others(first_length)
    @movie_lengths.any? do |second_length|
      (first_length + second_length) == @flight_length &&
        first_length != second_length
    end
  end
end
