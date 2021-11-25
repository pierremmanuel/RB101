countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}


def begins_with_b(string)
  string[0] == 'B'
end

p countries_and_capitals.find_all { |country, capital| begins_with_b(country) }
