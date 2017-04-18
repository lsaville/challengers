# Writing programming interview questions hasn't made me rich. Maybe trading
# Apple stocks will.
#
# Suppose we could access yesterday's stock prices as an array, where:
# - The values are the price in dollars of Apple stock.
# - A higher index indicates a later time.
#
# So if the stock cost $500 at 10:30am and $550 at 11:00am, then:
#
# stock_prices_yesterday[60] = 500
#
# Write an efficient function that takes stock_prices_yesterday and retruns the
# best profit I could have made from 1 purchase and 1 sale of 1 Apple stock
# yesterday.
#
# for example:
#
# stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
#
# get_max_profit(stock_prices_yesterday)
# # returns 6 (buying for $5 and selling for $11)
#
# No 'shorting'--you must buy before you sell. You may not buy and sell in the
# same time step (at least 1 minute must pass)
require 'pry'

prices = [10, 7, 5, 8, 11, 9]

# My solution after all the gotcha prompts, clearly not the most efficient

def get_max_profit(prices)
  max_profit = -1.0/0.0
  prices.each_with_index do |price, buy_index|
    prices.each_with_index do |test, sell_index|
      next if sell_index <= buy_index
      current_profit = test - price
      if current_profit > max_profit
       max_profit = current_profit
      end
    end
  end
  max_profit
end

# one of their intermediate solutions, the one where you're not going through
# the entire set again, only iterating over the remaining part of the array,
# same idea as my next scheme above but more efficient. Their use of for loops
# in Ruby is sort of tripping me out. I'm so unfamiliar with that approach
# that I did a double take to check if I was using the ruby problem set. The 
# use of for loops does enable you to iterate over a partial array using the 
# index from the out loop to cut the inner array into the novel chunk.

def get_max_profit(prices)
  max_profit = -1.0/0.0
  prices.each_with_index do |price, buy_index|
    for later_price in prices[buy_index+1..-1]
      current_profit = later_price - price
      max_profit = [max_profit, current_profit].max
    end
  end
  max_profit
end

# My stab at the single loop approach which I read something about in the 
# explaination, but haven't actually seen the solution to yet. It seems really
# similar to Ian Douglas' "get the max, min, and count looping only once". What
# I know from their description is that I can keep a running tally on several
# attributes: max_profit and minimum value. This approach is going to be more
# elegant because this problem of making sure the sell_price is later than the
# buy_price is automatically taken care of. As I'm working on it I also would
# like to note the use of [one_price, another_price].max as an alternative
# approach to using if one_price > another_price, reset the max.

def get_max_profit(prices)
  max_profit = -1.0/0.0
  lowest_price = 1.0/0.0
  prices.each do |current_price|
    lowest_price   = [current_price, lowest_price].min
    current_profit = current_price - lowest_price
    max_profit     = [max_profit, current_profit].max
  end
  max_profit
end

# The above approach fails when given an array of decreasing values and will
# not calculate a negative profit. This is because the lowest_price will always
# be the current_price in the case that they are decreasing. To remedy this 
# situation you can move the calculation of the lowest_price to the bottom of
# the loop, thus preventing the current_price from being the lowest_price and
# causing the profit to be zero. The Interview Cake approach also uses:
#
# min_price = prices[0]
# max_profit = prices[1] - prices[0]
#
# to start. It's probably better this way, but I'm kind of keen on the positive
# and negative infitities... novelty?

def get_max_profit(prices)
  max_profit = -1.0/0.0
  lowest_price = 1.0/0.0
  prices.each do |current_price|
    current_profit = current_price - lowest_price
    max_profit     = [max_profit, current_profit].max
    lowest_price   = [current_price, lowest_price].min
  end
  max_profit
end

blah = get_max_profit(prices)

binding.pry

"Something to make pry work"
