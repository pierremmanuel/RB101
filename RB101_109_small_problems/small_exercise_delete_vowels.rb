def remove_vowels(string)
  string.map{ |word| word.delete "aeiouAEIOU" }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(green YELLOW black white))
p remove_vowels(%w(ABC AEIOU XYZ))
