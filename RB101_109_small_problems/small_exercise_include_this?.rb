def include?(array, value)
  array.count(value) > 0
end

def include2?(array, value)
  array - [value] != array
end

def include3?(array, value)
  array.any?(value)
end

def include4?(array, value)
  !!array.find_index(value)
end


p include?([1,2,3,4,5], 3)
p include?([1,2,3,4,5], 6)
p include?([], 3)
p include?([nil], nil)
p include?([], nil)
