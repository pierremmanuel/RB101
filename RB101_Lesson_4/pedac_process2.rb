def compute_sequence(start_integer, number)
  row_number = 1
  array = []
  last_value = 0
  while row_number <= number
    sub_array = []
    column_index = 0
    start_value = start_integer + last_value
    while column_index < row_number
      sub_array << start_value + (start_integer * column_index)
      column_index += 1
    end
    array << sub_array
    last_value += (start_integer * row_number)
    row_number += 1
  end
  array
end

p compute_sequence(4, 4)

def sum_of_row_numbers(start_integer, number)
  compute_sequence(start_integer, number)[-1].sum
end

p sum_of_row_numbers(4, 4)
