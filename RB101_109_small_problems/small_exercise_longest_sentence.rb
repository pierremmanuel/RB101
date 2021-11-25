text = File.read('sample_text.txt')

def longest_sentence(text)
  sentences = text.split(/(?<=[\.\?!]|[\.\?!]")[\n| ]/)
  sentences.max_by { |sentence| sentence.split.size }.strip
end

def longest_paragraph(text)
  paragraphs = text.split(/(?<=[\.\?!"]|[\.\?!]")\n{2,}/)
  paragraphs.max_by { |paragraph| paragraph.split.size }.strip
end

def longest_word(text)
  text.split(/(?<=\w|\-)[^(a-z0-9\-)]|(?<=\w)[\-]/i).max_by(&:size)
end

puts "=> The longest sentence in the text is: '#{longest_sentence(text)}'"
puts "=> The longest sentence is #{longest_sentence(text).split.size}-word long."
puts " "
puts "=> The longest paragraph in the text is: '#{longest_paragraph(text)}'"
puts "=> The longest paragraph is #{longest_paragraph(text).split.size}-word long."
puts " "
puts "=> The longest word in the text is '#{longest_word(text)}'"
puts "=> The longest word is #{longest_word(text).size}-letter long."
