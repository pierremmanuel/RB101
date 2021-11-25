def find_fibonacci_index_by_length(number)
i, fibonacci = 0, [1, 1]
  while i.digits.size < number
    i = fibonacci[-1] + fibonacci[-2]
    fibonacci << i
  end
fibonacci.size
end

p find_fibonacci_index_by_length(2)
p find_fibonacci_index_by_length(3)
p find_fibonacci_index_by_length(10)
p find_fibonacci_index_by_length(100)
p find_fibonacci_index_by_length(1000)
