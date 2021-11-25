BLOCKS = [["B", "O",] , ["X", "K",] , ["D", "Q",] , ["C", "P",] , ["N", "A",],
["G", "T",] , ["R", "E",] , ["F", "S",] , ["J", "W",] , ["H", "U",],
["V", "I",] , ["L", "Y",] , ["Z", "M",]]

def block_word?(word)
  BLOCKS.each { |block| return false if word.upcase.count(block.join) > 1 }
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?("bblu") == false
