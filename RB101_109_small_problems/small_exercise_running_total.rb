def running_total(array)
  array.map.with_index { |_, index| array[0..index].sum }
end
p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])
