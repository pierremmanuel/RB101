
def center_of(string)
  center = (string.size / 2).ceil
  string.size.even? ? string[center - 1, 2] : string[center]
end

p center_of('I love ruby')
# == 'e'
p center_of('Launch School')
# == ' '
p center_of('Launch')
# == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
