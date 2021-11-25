def word_sizes(sentence)
  result = {}
  sentence.split.each do |word|
  new_word = word.delete('^A-Za-z')
  result[new_word.size] ? result[new_word.size] += 1 : result[new_word.size] = 1
  end
result
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")
p word_sizes('')
