def multiply_all_pairs(array, array2)
  array.each_with_object([]) do |num, result|
    array2.each { |num2| result << num * num2 }
  end.sort
end

def multiply_all_pairs2(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end

def multiply_all_pairs3(arr1, arr2)
  arr1.product(arr2).map { |sub_arr| sub_arr.reduce(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
