def multiply_list(array, array2)
  array.zip(array2).map { |x, y| x * y }
end

def multiply_list2(array, array2)
  array.zip(array2).map { |arr| arr.inject(:*) }
end

p multiply_list2([3, 5, 7], [9, 10, 11])
# == [27, 50, 77]
