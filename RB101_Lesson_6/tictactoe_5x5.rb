INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_POINTS = 5
MARKERS_TO_WIN = 4 # pick 3, 4, or 5

COORDONATES = ["A1", "B1", "C1", "D1", "E1",
               "A2", "B2", "C2", "D2", "E2",
               "A3", "B3", "C3", "D3", "E3",
               "A4", "B4", "C4", "D4", "E4",
               "A5", "B5", "C5", "D5", "E5"]

LINES = [["A3", "B4", "C5"], ["C5", "D4", "E3"], ["A2", "B3", "C4", "D5"],
         ["B5", "C4", "D3", "E2"], ["A1", "B2", "C3", "D4", "E5"],
         ["E1", "D2", "C3", "B4", "A5"], ["B1", "C2", "D3", "E4"],
         ["A4", "B3", "C2", "D1"], ["C1", "D2", "E3"], ["A3", "B2", "C1"],
         ["A1", "B1", "C1", "D1", "E1"], ["A2", "B2", "C2", "D2", "E2"],
         ["A3", "B3", "C3", "D3", "E3"], ["A4", "B4", "C4", "D4", "E4"],
         ["A5", "B5", "C5", "D5", "E5"], ["A1", "A2", "A3", "A4", "A5"],
         ["B1", "B2", "B3", "B4", "B5"], ["C1", "C2", "C3", "C4", "C5"],
         ["D1", "D2", "D3", "D4", "D5"], ["E1", "E2", "E3", "E4", "E5"]]

WINNING_COMBOS = []

LINES.each do |arr|
  (0...arr.size - 2).each { |i| WINNING_COMBOS << arr[i, MARKERS_TO_WIN] }
end

WINNING_COMBOS = WINNING_COMBOS.select { |arr| arr.size >= MARKERS_TO_WIN }

WELCOME_MESSAGE = <<-MSG
WELCOME TO TICTACTOE!

You will play against the computer, try to reach #{WINNING_POINTS} points first!
Your marker on the board is #{PLAYER_MARKER}, the computer marker is #{COMPUTER_MARKER}.
You must align #{MARKERS_TO_WIN} 'X' to win one round.

Good luck!

Press 'enter' to start.
MSG

WHO_BEGINS_MESSAGE = <<-MSG
Select who begins first: the computer or you?

Enter '1' for you

Enter '2' for the computer

Enter '3' to let the computer decide
MSG

WHO_BEGINS = { player: "1", computer: "2", random: "3" }

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

def display_welcome
  clear_screen
  prompt(WELCOME_MESSAGE)
  gets
  clear_screen
end

def who_begins
  clear_screen
  choice = ""
  loop do
    prompt(WHO_BEGINS_MESSAGE)
    choice = gets.chomp
    break if WHO_BEGINS.values.include?(choice)
    clear_screen
    prompt "Pick a valid number."
  end
  choice = WHO_BEGINS.values[0, 2].sample if choice == 3
  WHO_BEGINS.key(choice)
end

def joinor(arr, separator = ",", word = "or")
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(separator)
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(board)
  clear_screen
  puts "     A     B     C     D     E   "
  puts "  +-----|-----|-----|-----|-----+"
  puts "  |     |     |     |     |     |"
  puts "1 |  #{board['A1']}  |  #{board['B1']}  |  #{board['C1']}  |\
  #{board['D1']}  |  #{board['E1']}  |"
  puts "  |     |     |     |     |     |"
  puts "  |-----|-----|-----|-----|-----|"
  puts "  |     |     |     |     |     |"
  puts "2 |  #{board['A2']}  |  #{board['B2']}  |  #{board['C2']}  |\
  #{board['D2']}  |  #{board['E2']}  |"
  puts "  |     |     |     |     |     |"
  puts "  |-----|-----|-----|-----|-----|"
  puts "  |     |     |     |     |     |"
  puts "3 |  #{board['A3']}  |  #{board['B3']}  |  #{board['C3']}  |\
  #{board['D3']}  |  #{board['E3']}  |"
  puts "  |     |     |     |     |     |"
  puts "  |-----|-----|-----|-----|-----|"
  puts "  |     |     |     |     |     |"
  puts "4 |  #{board['A4']}  |  #{board['B4']}  |  #{board['C4']}  |\
  #{board['D4']}  |  #{board['E4']}  |"
  puts "  |     |     |     |     |     |"
  puts "  |-----|-----|-----|-----|-----|"
  puts "  |     |     |     |     |     |"
  puts "5 |  #{board['A5']}  |  #{board['B5']}  |  #{board['C5']}  |\
  #{board['D5']}  |  #{board['E5']}  |"
  puts "  |     |     |     |     |     |"
  puts "  +-----|-----|-----|-----|-----+"
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  COORDONATES.each { |coordonate| new_board[coordonate] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |coordonate| board[coordonate] == INITIAL_MARKER }
end

def player_places_piece!(board, round)
  square = ''
  loop do
    prompt "ROUND #{round}: Choose a square (#{joinor(empty_squares(board))}):"
    square = gets.chomp.upcase
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def find_line(board, marker)
  WINNING_COMBOS.find do |line|
    board.values_at(*line).count(marker) == MARKERS_TO_WIN - 1 &&
      board.values_at(*line).count(INITIAL_MARKER) == 1
  end
end

def find_strategic_square(board, marker)
  strategic_line = find_line(board, marker)
  strategic_line.find { |coor| board[coor] == INITIAL_MARKER } if strategic_line
end

def find_square(board)
  good_line = WINNING_COMBOS.find do |line|
    board.values_at(*line).count(COMPUTER_MARKER) >= 1 &&
      board.values_at(*line).count(INITIAL_MARKER) >= 2 &&
      board.values_at(*line).count(PLAYER_MARKER) == 0
  end
  good_line.find { |coord| board[coord] == INITIAL_MARKER } if good_line
end

def find_center_square(board)
  board["C3"] = COMPUTER_MARKER if board["C3"] == " "
end

def computer_places_piece!(board)
  square = find_strategic_square(board, COMPUTER_MARKER)
  square = find_strategic_square(board, PLAYER_MARKER) if !square
  square = find_square(board) if !square
  square = find_center_square(board) if !square
  square = empty_squares(board).sample if !square

  board[square] = COMPUTER_MARKER
end

def place_piece!(board, round, current_player)
  if current_player == :player
    player_places_piece!(board, round)
  else
    computer_places_piece!(board)
  end
end

def change_player(current_player)
  current_player == :player ? :computer : :player
end

def play_one_round(board, round, current_player)
  loop do
    display_board(board)
    place_piece!(board, round, current_player)
    current_player = change_player(current_player)
    break if someone_won?(board) || board_full?(board)
    clear_screen
  end
end

def board_full?(board)
  empty_squares(board).empty?
end

def round_winner(board)
  WINNING_COMBOS.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == MARKERS_TO_WIN
      return :player
    elsif board.values_at(*line).count(COMPUTER_MARKER) == MARKERS_TO_WIN
      return :computer
    end
  end
  nil
end

def someone_won?(board)
  !!round_winner(board)
end

def display_winner(board, round)
  if someone_won?(board)
    prompt "ROUND #{round}: #{round_winner(board).to_s.upcase} wins!"
  else
    prompt "ROUND #{round}: It's a tie!"
  end
end

def display_scores(scores, board)
  scores[round_winner(board)] += 1 if round_winner(board)
  prompt("PLAYER: #{scores[:player]} | COMPUTER: #{scores[:computer]}")
end

def play_next_round?
  prompt "Press enter to play the next round, any other key and enter to quit."
  continue = gets.chomp
  continue.empty?
end

def game_over?(scores)
  !!scores.values.find { |v| v == WINNING_POINTS }
end

def display_champion(scores)
  champion = scores.key(WINNING_POINTS)
  prompt "The champion is #{champion.to_s.upcase}!" if champion
end

def play_again?
  prompt "Do you want to play again? (Yes or No)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def display_goodbye
  clear_screen
  prompt "Thanks for playing, see you next time!"
end

display_welcome

loop do
  round = 1
  scores = { player: 0, computer: 0 }
  current_player = who_begins

  loop do
    board = initialize_board
    play_one_round(board, round, current_player)

    display_board(board)
    display_winner(board, round)
    display_scores(scores, board)

    round += 1
    break if game_over?(scores) || !play_next_round?
  end

  display_champion(scores)
  break unless play_again?
end

display_goodbye
