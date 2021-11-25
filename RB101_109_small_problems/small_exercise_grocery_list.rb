def buy_fruit(array)
  array.map { |arr| [arr[0]] * arr[1] }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
# ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]
