def high_part(n)
  white_spaces = (n / 2).floor - 1
  (n / 2).floor.times do
    display = "*" + " " * white_spaces + "*" + " " * white_spaces + "*"
    puts display.center(n)
    white_spaces -= 1
  end
end

def middle(n)
  puts "*" * n
end

def low_part(n)
  white_spaces = 0
  (n / 2).floor.times do
    display = "*" + " " * white_spaces + "*" + " " * white_spaces + "*"
    puts display.center(n)
    white_spaces += 1
  end
end

def star(n)
  high_part(n)
  middle(n)
  low_part(n)
end

star(7)
