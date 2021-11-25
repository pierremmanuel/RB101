def bubble_sort!(array)
  array.size.times do
    for i in 0..array.size - 1
      j = i + 1
      array[i], array[j] = array[j], array[i] if (array[i] <=> array[j]) == 1
    end
  end
  array
end



# array = [5, 3]
# p bubble_sort!(array)
# array == [3, 5]

p bubble_sort!([5, 4, 3, 2, 1])

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
