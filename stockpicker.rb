# frozen_string_literal: true

# create an array of array with the profits for each combination

def stock_picker(history)
  best_sell_array = [0]
  history.each_with_index do |eo, io|
    best_sell_array[io] = get_best_sell(io, eo, history)
  end
  result_day_pairs = get_result_day_pairs(best_sell_array)
  profit = history[result_day_pairs[0]-1] - history[result_day_pairs[1]-1]
  "Buy on day #{result_day_pairs[0]} and sell on day #{result_day_pairs[1]} for a profit of #{profit}"
end

def get_best_sell(buy_day, buy_price, history)
  profits_array = [0]
  day_profit = [0]
  history.each_with_index do |ei, ii|
    profits_array[ii] = ii > buy_day ? ei - buy_price : 0
  end
  day_profit << profits_array.index(profits_array.max)
  day_profit << profits_array.max
end

def get_result_day_pairs(best_sell_array)
  best_sell = 0
  result_day_pairs = [0]
  best_sell_array.each_index do |i|
    best_sell = best_sell_array[i][1] > best_sell ? best_sell_array[i][1] : best_sell
    result_day_pairs = [i[0] + 1, i]
  end
  result_day_pairs
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
