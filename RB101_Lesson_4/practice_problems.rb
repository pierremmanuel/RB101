flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# print the hash version with the array with indeces as values
hash = {}
flintstones.each_with_index { |value, idx| hash[value] = idx }
p hash

# print the index of the first name that starts with 'Be'
p flintstones.index { |name| name[0, 2] == 'Be'}

# Get the three first letters of each word in the array
flintstones.each { |name| name.slice(3, name.size) }
p flintstones
# Mutable version, name = name [0, 3] can be replaced by name[0, 3]
flintstones.map! { |name| name = name[0, 3] }
p flintstones

# Create a hash the expresses the frequency with which each letter occurs in the string
statement = "The Flintstones Rock"
frequency_hash = {}

counter = 0
while counter < statement.length do
  current_letter = statement[counter]

  if frequency_hash[current_letter]
    frequency_hash[current_letter] += 1
  else
    frequency_hash[current_letter] = 1
  end

  counter += 1
end
frequency_hash.delete(' ')
p frequency_hash
# Second solution to the problem

frequencies = {}
letters = ("A".."Z").to_a + ("a".."z").to_a

letters.each do |letter|
  occurrence = statement.scan(letter).count
  frequencies[letter] = occurrence if occurrence > 0
end

p frequencies

# Last exercise, give the hash below create a new key 'age_group',
# with 3 possible values: 'kid', 'adult', 'senior'.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  if details["age"] < 18
    details["age_group"] = "kid"
  elsif details["age"] > 64
    details["age_group"] = "senior"
  else
    details["age_group"] = "adult"
  end
end

p munsters
