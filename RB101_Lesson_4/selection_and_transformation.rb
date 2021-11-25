# SELECTION EXAMPLE
# ----------------------------------------------

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# EASY METHOD
# def select_fruit(hash)
#   keys_array = []
#   hash.select do |key, value|
#     value == "Fruit"
#   end
# end

def select_fruit(produce_list)
produce_keys = produce_list.keys
counter = 0
selected_fruits = {}

loop do
  break if counter == produce_keys.size

  current_key = produce_keys[counter]
  current_value = produce_list[current_key]

  if current_value == "Fruit"
    selected_fruits[current_key] = current_value
  end

  counter += 1
end

selected_fruits
end

p select_fruit(produce)
p produce


# TRANSFORMATION EXAMPLES
# -----------------------------------------------

# This first method doesn't mutate the original array.
# The reason is because we are pushing the results into new_numbers, a new array.

my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers(numbers)
  new_numbers = []
  counter = 0
  loop do
    break if counter == numbers.size

    new_numbers << numbers[counter] * 2

    counter += 1
  end
  new_numbers
end

p double_numbers(my_numbers)
p my_numbers

# How to createa method that mutates the original array below?
# You need to reassign the values of the array from within the array.
# This way the my_numbers object will be mutated

def double_numbers!(numbers)
  counter = 0
  loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end
  numbers
end

p double_numbers!(my_numbers)
p my_numbers


# Create a method that transforms each value by index number
def double_numbers_with_idx(numbers)
  counter = 0
  new_array = []

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    new_array << current_number

    counter += 1
  end
  new_array
end

p double_numbers_with_idx(my_numbers)
p my_numbers

# Adding an extra parameter to the method to add more possibilities
def multiply(numbers, multiplier)
  new_array = []
  counter = 0
  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= multiplier
    new_array << current_number
    counter += 1
  end
  new_array
end

p multiply(my_numbers, 3)
p my_numbers
