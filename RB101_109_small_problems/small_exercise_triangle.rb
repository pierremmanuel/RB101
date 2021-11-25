def triangle(x, y, z)
  sides = [x, y, z]
    if sides.max > sides.min(2).inject(&:+) || sides.any?(&:zero?)
      :invalid
    elsif x == y && x == z && y == z
      :equilateral
    elsif x == y || x == z || y == z
      :isosceles
    else
      :scalene
    end
end

 p triangle(3, 3, 3)
# == :equilateral
 p triangle(3, 3, 1.5)
# == :isosceles
 p triangle(3, 4, 5)
# == :scalene
 p triangle(0, 3, 3)
# == :invalid
 p triangle(3, 1, 1)
# == :invalid
