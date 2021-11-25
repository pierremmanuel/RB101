def repeater(string)
  string.chars.zip(string.chars).join
end

def double_consonants(string)
  string.chars.map{ |chr| /[bcdfghjklmpqrstvwxyz]/i.match?(chr) ? chr * 2 : chr }.join
end



p double_consonants('String')
# == "SSttrrinngg"
p double_consonants("Hello-World!")
# == "HHellllo-WWorrlldd!"
p double_consonants("July 4th")
# == "JJullyy 4tthh"
p double_consonants('')
# == ""

repeater('Hello')
# == "HHeelllloo"
repeater("Good job!")
# == "GGoooodd  jjoobb!!"
repeater('')
# == ''
