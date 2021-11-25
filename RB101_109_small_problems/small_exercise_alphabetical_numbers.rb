NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine ten
                  eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen
                  nineteen twenty)

def alphabetic_number_sort(numbers)
  result = []
  numbers.each { |num| result << NUMBER_WORDS[num]}
  result.sort.each { |word| word = NUMBER_WORDS.index(word)}
end

p alphabetic_number_sort((0..19).to_a)
