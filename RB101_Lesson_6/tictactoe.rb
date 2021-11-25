INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_POINTS = 5
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

WELCOME_MESSAGE = <<-MSG
WELCOME TO TICTACTOE!

You will play against the computer, try to reach #{WINNING_POINTS} points first!
Your marker on the board is #{PLAYER_MARKER}, the computer marker is #{COMPUTER_MARKER}.

Good luck!

Press 'enter' to start.
MSG

WHO_BEGINS_MESSAGE = <<-MSG
Select who begins first: the computer or you?

Enter '1' for you

Enter '2' for the computer

Enter '3' to let the computer decide
MSG

WHO_BEGINS = { player: 1, computer: 2, random: 3 }

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
    choice = gets.chomp.to_i
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
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board, round)
  square = ''
  loop do
    prompt "ROUND #{round}: Choose a square (#{joinor(empty_squares(board))}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def find_line(board, marker)
  WINNING_LINES.find do |line|
    board.values_at(*line).count(marker) == 2 &&
      board.values_at(*line).count(INITIAL_MARKER) == 1
  end
end

def find_winning_square(board)
  winning_line = find_line(board, COMPUTER_MARKER)
  winning_line.find { |num| board[num] == INITIAL_MARKER } if winning_line
end

def find_threat_square(board)
  threat_line = find_line(board, PLAYER_MARKER)
  threat_line.find { |num| board[num] == INITIAL_MARKER } if threat_line
end

def square_5(board)
  board[5] = COMPUTER_MARKER if board[5] == " "
end

def computer_places_piece!(board)
  square = find_winning_square(board)
  square = find_threat_square(board) if !square
  square = square_5(board) if !square
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

def play_one_round!(board, round, current_player)
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
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return :player
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
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
  prompt "Press enter to play the next round, any other key to quit."
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
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def display_goodbye
  clear_screen
  prompt "Thanks for playing, see you next time!"
end

display_welcome

loop do
  round, scores = 1, { player: 0, computer: 0 }
  current_player = who_begins

  loop do
    board = initialize_board
    play_one_round!(board, round, current_player)

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
