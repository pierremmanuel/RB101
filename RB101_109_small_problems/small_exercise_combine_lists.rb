def interleave(array, array2)
  [array, array2].transpose.flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
# == [1, 'a', 2, 'b', 3, 'c']
