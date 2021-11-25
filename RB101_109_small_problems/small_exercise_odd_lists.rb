def oddities(array)
  array.select { |element| array.index(element).even?  }
end

array = [2, 3, 4, 5, 6]

p oddities(array)
p array
