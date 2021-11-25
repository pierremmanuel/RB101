def triangle(n, upside_down, right_just)
  n.times do |num|
    pattern = upside_down ? (n - num) : (num + 1)
    side = right_just ? n : 0
    puts "#{'*' * pattern}".rjust(side)
  end
end

triangle(5, true, false)
triangle(5, true, true)
triangle(5, false, false)
triangle(5, false, true)

# def triangle(n)
#   (0..n).map{ |i| puts "#{'*' * (n - i) + ' ' * i}" }
# end
#
# def triangle2(n)
#   (0..n).map{ |i| puts "#{' ' * i + '*' * (n - i)}" }
# end
#
# def triangle3(n)
#   (0..n).map{ |i| puts "#{' ' * (n - i) + '*' * i}" }
# end
#
# def triangle4(n)
#   (0..n).map{ |i| puts "#{'*' * i + ' ' * (n - i)}" }
# end
#
#
#
# triangle(5)
# triangle2(5)
# triangle3(5)
# triangle4(5)
