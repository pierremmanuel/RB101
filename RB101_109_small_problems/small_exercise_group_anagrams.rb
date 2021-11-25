words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


# My solution
words.map { |word| word.chars.sort.join }.uniq.map do |factor|
  words.select { |word| word.chars.sort.join == factor }
end.each { |group| p group }

# using the group_by method on words

words.group_by { |word| word.chars.sort.join }.values.each { |arr| p arr }
