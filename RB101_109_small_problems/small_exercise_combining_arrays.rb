# MY SOLUTION
# def halvsies(arr)
#   n = arr.size
#   x = n / 2
#   y = (n + 1) / 2
#   result = []
#   n.odd? ? result << arr[0, y] << arr[y, n - y] : result << arr[0, x] result << arr[x, n - x]
#   result
# end


def halvsies(array)
  half = array.size.divmod(2)
  [] << array[0, half.sum] << array[half.sum, half[0]]
end

def halvsies2(arr)
  first_half = []
  while first_half.length >= arr.length
    first_half << arr.shift
  end
[first_half, arr]
end


p halvsies([1, 2, 3, 4])
# == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3])
# == [[1, 5, 2], [4, 3]]
p halvsies([5])
# == [[5], []]
p halvsies([])
# == [[], []]
