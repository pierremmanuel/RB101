def rotate_rightmost_digits(num, idx)
  num = num.to_s.chars
  num << num.delete_at(-idx)
  num.join
end

def max_rotation(integer)
  n = integer.to_s.size
  loop do
    integer = rotate_rightmost_digits(integer, n)
    n -= 1
    break if n <= 1
  end
  integer.to_i
end

p max_rotation(3004)

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
