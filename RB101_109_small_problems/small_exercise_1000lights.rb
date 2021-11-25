require "pry"
# my first method
def method1(n)
  switches, adder = [true] * n, 2
  while adder <= n
    i = adder
    while i <= n
      switches[i - 1] = !switches[i -1]
      i = i + adder
    end
    adder += 1
  end
  switches.map.with_index { |value, idx| idx + 1 if value } - [nil]
end

# refactored method
def thousand_lights(n)
  lights = [true] * n
  (2..n).each do |num|
    num.step(n, num) do |i|
      lights[i - 1] = !lights[i - 1]
    end
  end
  lights.map.with_index { |value, idx| idx + 1 if value } - [nil]
end

p thousand_lights(4)
p thousand_lights(9)
p thousand_lights(15)
p thousand_lights(16)
p thousand_lights(25)
p thousand_lights(36)
p thousand_lights(49)
p thousand_lights(64)
