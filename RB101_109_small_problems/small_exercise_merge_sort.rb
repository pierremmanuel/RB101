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

def merge_sort(array)
  return array if array.size == 1

  part1 = array[0...array.size / 2]
  part2 = array[array.size / 2...array.size]

  part1 = merge_sort(part1)
  part2 = merge_sort(part2)

  merge(part1, part2)
end


array = [4, 6, 4, 34, 22]
p merge_sort(array)
