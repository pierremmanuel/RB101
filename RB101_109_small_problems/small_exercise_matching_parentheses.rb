def balanced?(string)
  open, close = 0, 0
  string.scan(/[\(\[\{\)\]\}]/).each do |character|
    character =~ /[\(\[\{]/ ? open += 1 : close += 1
    break if close > open
  end
  quotes = string.scan(/(?<=[^a-z])'|'(?=[^a-z])|"/i).size
  open == close && quotes.even?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?("()[]''""{} ") == true
p balanced?("()[](''""{} ") == false
p balanced?("()']['""{} ") == false
p balanced?("()[]''""{}{ ") == false
p balanced?("()']['""{} ") == false
p balanced?(" is") == true
p balanced?('¿[is]?') == true
p balanced?('¿"is"?') == true
p balanced?("¿'is'?") == true
p balanced?("¿'is'?'") == false
p balanced?("¿{is}?") == true
p balanced?("¿{i}?") == true
p balanced?("¿is}?") == false
p balanced?("¿{is?") == false
p balanced?("¿'is?") == false
p balanced?("¿is'?") == false
p balanced?("¿'s'?") == true
p balanced?('¿"is?') == false
p balanced?('¿is"?') == false
p balanced?('¿"s"?') == true
p balanced?("¿[i]?") == true
p balanced?("¿is]?") == false
p balanced?("¿[is?") == false
