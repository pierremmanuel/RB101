WIDTH = 76

def print_border_line(msg)
  msg.size > WIDTH ? (puts "+-#{'-' * WIDTH}-+") : (puts "+-#{'-' * msg.size}-+")
end

def print_empty_line(msg)
  msg.size > WIDTH ? (puts "| #{" " * WIDTH} |") : (puts "| #{" " * msg.size} |")
end

def print_smaller_message(msg)
  puts "| #{msg} |"
end
# c = counter, i = iterator, r = remainder
def print_larger_message(msg)
  i, r = msg.size.divmod(WIDTH)
  c = 0
  loop do
    puts "| #{msg[c * WIDTH, r]}#{" " * (WIDTH - r)} |" if c == i && break
    puts "| #{msg[c * WIDTH, WIDTH]} |"
   c += 1
  end
end

def print_message(msg)
  print_smaller_message(msg) if msg.size < WIDTH
  print_larger_message(msg) if msg.size >= WIDTH
end

def print_in_box(msg)
  print_border_line(msg)
  print_empty_line(msg)
  print_message(msg)
  print_empty_line(msg)
  print_border_line(msg)
end

print_in_box('')
print_in_box('To boldly go where no one has gone before.')
print_in_box('Tech Talks are a bi-weekly webinar series for the greater Launch School community created to facilitate the sharing and demonstration of interesting tech topics. Presentation topics may vary widely, and are not required to be related to Launch School\'s curriculum. This casual meetup-style webinar is a chance to learn from others and share your own experiences. See previous and upcoming talks here. You can even submit your own idea for a talk!')

#better solution
def print_in_box2(string)
  max_middle_spaces = string.length <= 76 ? string.length : 76
  puts "+-#{'-' * (max_middle_spaces)}-+"
  puts "| #{' ' * (max_middle_spaces)} |"

  while string.length > 76 do
    string_start = string.slice!(/.{,75}\s/)
    puts "| #{string_start + (' ' * (max_middle_spaces - string_start.length))} |"
  end

  puts "| #{string + (' ' * (max_middle_spaces - string.length))} |"

  puts "| #{' ' * (max_middle_spaces)} |"
  puts "+-#{'-' * (max_middle_spaces)}-+"
end

print_in_box2('')
print_in_box2('To boldly go where no one has gone before.')
print_in_box2('Tech Talks are a bi-weekly webinar series for the greater Launch School community created to facilitate the sharing and demonstration of interesting tech topics. Presentation topics may vary widely, and are not required to be related to Launch School\'s curriculum. This casual meetup-style webinar is a chance to learn from others and share your own experiences. See previous and upcoming talks here. You can even submit your own idea for a talk!')
