# puts "Enter the first number"
# number1 = gets.chomp
# puts "Enter the second number"
# number2 = gets.chomp
#
# array = [number1, number2]
# OPERATORS = %w(+ - * / % **)
#
# def calculator(number1, number2, operator)
#   number1 = number1.to_i
#   number2 = number2.to_i
#   case operator
#   when "+"
#     number1 + number2
#   when "-"
#     number1 - number2
#   when "*"
#     number1 * number2
#   when "/"
#     number1 / number2
#   when "%"
#     number1 % number2
#   when "**"
#     number1 ** number2
#   end
# end
#
# def do_operations(array)
#   OPERATORS.each do |op|
#     puts "#{array[0]} #{op} #{array[1]} = #{calculator(array[0], array[1], op)}"
#   end
# end
#
# do_operations(array)


ops = %w(+ - * / % **)

puts "==> Enter the first number:"
n1 = gets.chomp.to_i
puts "==> Enter the second number:"
n2 = gets.chomp.to_i

ops.each { |op| puts "#{n1} #{op} #{n2} = #{[n1, n2].inject(op.to_sym)}" }
