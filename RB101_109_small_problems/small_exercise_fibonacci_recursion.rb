def fibonacci(n)
  if n == 1 || n == 2
    return 1
  else
    return fibonacci(n - 2) + fibonacci(n - 1)
  end
end

def fibonacci_procedural(number)
  a, b = 0, 1
  (number - 1).times { a, b = b, a + b }
  b
end

# to return the last digit of the nth fibonacci number rapidely
# and without using too much processing
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  last_2.last
end

p fibonacci_last(1)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(11)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(21) # -> 4
p fibonacci_last(31) # -> 4
puts "----------"
p fibonacci_last(2)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(12)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(22) # -> 4
p fibonacci_last(32) # -> 4
puts "----------"
p fibonacci_last(3)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(13) # -> 3 (this is a 208989 digit number)
p fibonacci_last(23) # -> 4
p fibonacci_last(33) # -> 4
puts "----------"
p fibonacci_last(4)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(14)
p fibonacci_last(24) # -> 4
p fibonacci_last(34) # -> 4
