def merge(array, array2)
  part1, part2 = array.dup, array2.dup

  part1.each_with_index do |_, i|
    part2.each_with_index do |_, j|
      part1[i], part2[j] = part2[j], part1[i] if part2[j] < part1[i]
    end
  end
  part2.size.times { part1 << part2.delete(part2.min) }
  part1
end

a = [1, 5, 9]
b = [2, 6, 8]

p merge(a, b) #== [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) #== [1, 4, 5]
p merge([1, 4, 5], []) #== [1, 4, 5]
