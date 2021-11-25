def reverse!(array)
  copy, n = array.clone, array.size - 1
  (0..n).map{ |i| array[i] = copy[n - i] }
  array
end

# OTHER SOLUTION WITH FOR
#------------------------------------------
# def reverse!(array)
#   copy, n = array.clone, array.size - 1
#   for i in 0..n
#     array[i] = copy[n - i]
#   end
# array
# end

list = [1,2,3,4,5,1,2]
result = reverse!(list)
p list
p result

p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list)
p list

list = ['abc']
p reverse!(list)
p list

list = []
p reverse!(list)
p list
