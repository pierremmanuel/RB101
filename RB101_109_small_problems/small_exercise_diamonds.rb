def print_row(grid_size, white_spaces)
  numbers_of_stars = grid_size - (2 * white_spaces)
  stars = "*" * numbers_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_white_spaces = (grid_size - 1) / 2
  max_white_spaces.downto(0) { |white_spaces| print_row(grid_size, white_spaces) }
  1.upto(max_white_spaces) { |white_spaces| print_row(grid_size, white_spaces) }
end

diamond(9)


# FURTHER EXPLORATION, print an empty diamond

def print_row2(grid_size, border_spaces)
  optional_star = ((border_spaces * 2) == grid_size - 1 ? 0 : 1)
  center_spaces = grid_size - (1 + optional_star) - (border_spaces * 2)
  row = "*" + " " * center_spaces + "*" * optional_star
  puts row.center(grid_size)
end

def diamond2(grid_size)
  max_border_spaces = (grid_size - 1) / 2
  max_border_spaces.downto(0) { |border_spaces| print_row2(grid_size, border_spaces) }
  1.upto(max_border_spaces) { |border_spaces| print_row2(grid_size, border_spaces) }
end

diamond2(11)

=begin
Examples :

line 1 : border_spaces = 4, star = 1, center_spaces = 0, star = 0, border_spaces = 4
line 1 : border_spaces = 3, star = 1 , center_spaces = 1, star = 1, border_spaces = 3
line 1 : border_spaces = 2, star = 1, center_spaces = 3, star = 1, border_spaces = 2
line 1 : border_spaces = 1, star = 1, center_spaces = 5, star = 1, border_spaces = 1


=end
