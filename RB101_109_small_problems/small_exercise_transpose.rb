matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


def transpose(matrix)
  (0...matrix[0].size).map { |i| matrix.map { |row| row[i] } }
end

# new_matrix = transpose(matrix)
#
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

def rotate90(matrix)
  transpose(matrix.reverse)
end

def rotate(matrix, degrees)
  rotations = degrees / 90
  new_matrix = matrix
  rotations.times { new_matrix = rotate90(new_matrix)}
  new_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

p rotate(matrix1, 180)
