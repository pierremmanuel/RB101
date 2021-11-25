MAX_TOTAL = 21
WINNING_SCORE = 5

VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
SUITS = { hearts: "\u2665", diamonds: "\u2666",
          spades: "\u2660", clubs: "\u2663" }

WELCOME_MESSAGE = <<-MSG
WELCOME TO #{MAX_TOTAL}!

#{MAX_TOTAL} is a cards game. You will play against the dealer. The goal is for you to
have a better score than the dealer, whithout going over #{MAX_TOTAL} points. The player
that gets more than #{MAX_TOTAL} points will 'BUST' and lose the round.

Once you get your first two cards, you can choose to 'HIT' another card or 'STAY'
if you think you can beat the dealer.

You will need to win #{WINNING_SCORE} rounds to win the game.

Press 'enter' to continue
MSG

POINTS_MESSAGE = <<-MSG
POINTS:

- 2:    2 points     |     - 10:       10 points
- 3:    3 points     |     - jack:     10 points
- 4:    4 points     |     - queen:    10 points
- 5:    5 points     |     - king:     10 points
- 6:    6 points     |
- 7:    7 points     |     - ace:      11 points if your total score is below #{MAX_TOTAL},
- 8:    8 points     |                  1 point if your total score is above #{MAX_TOTAL}.
- 9:    9 points     |

Press 'enter' to start.
MSG

HIT_OR_STAY_MESSAGE = <<-MSG
Would you like to:

1) Hit

2) Stay
MSG

HIDDEN_CARD = ["+---------+",
               "|\\\\\\\\\\\\\\\\\\|",
               "|/////////|",
               "|\\\\\\\\\\\\\\\\\\|",
               "|/////////|",
               "|\\\\\\\\\\\\\\\\\\|",
               "+---------+"]

def reset_data(game_data)
  game_data[:player][:hand] = []
  game_data[:dealer][:hand] = []
  game_data[:player][:total] = 0
  game_data[:dealer][:total] = 0
end

def prompt(message)
  puts "=> #{message}"
end

def prompt_pause(msg, time=1)
  puts "=> #{msg}"
  sleep(time)
end

def display_empty_line
  puts " "
end

def clear_screen
  system 'clear'
end

def prompt_welcome
  clear_screen
  prompt WELCOME_MESSAGE
  gets
  clear_screen
end

def prompt_points_message
  prompt POINTS_MESSAGE
  gets
  clear_screen
end

def prompt_shuffling_cards
  prompt "Shuffling cards..."
  3.times do
    print ". "
    sleep 1
  end
  clear_screen
end

def initialize_deck
  SUITS.keys.product(VALUES)
end

def initialize_hands(deck, game_data)
  2.times { game_data[:player][:hand] << slice_card!(deck) }
  2.times { game_data[:dealer][:hand] << slice_card!(deck) }
end

def display_scores(game_data)
  prompt "DEALER: #{game_data[:dealer][:score]} =====\
   PLAYER: #{game_data[:player][:score]}"
end

def display_player_total(game_data)
  prompt "Your current total is #{game_data[:player][:total]}."
end

def display_dealer_total(game_data)
  prompt "The dealer's current total is #{game_data[:dealer][:total]}."
  display_empty_line
end

def make_seen_card(lines, card)
  s = SUITS[card[0]]
  v = card[1]
  lines[0] << "+---------+"
  if v == 10
    lines[1] << "|#{v}       |"
    lines[2] << "|         |"
    lines[3] << "|    #{s}    |"
    lines[4] << "|         |"
    lines[5] << "|       #{v}|"
  else
    lines[1] << "|#{v}        |"
    lines[2] << "|         |"
    lines[3] << "|    #{s}    |"
    lines[4] << "|         |"
    lines[5] << "|        #{v}|"
  end
  lines[6] << "+---------+"
end

def make_hidden_card(lines)
  lines[0] << HIDDEN_CARD[0]
  lines[1] << HIDDEN_CARD[1]
  lines[2] << HIDDEN_CARD[2]
  lines[3] << HIDDEN_CARD[3]
  lines[4] << HIDDEN_CARD[4]
  lines[5] << HIDDEN_CARD[5]
  lines[6] << HIDDEN_CARD[6]
end

def display_dealer_cards(hand)
  lines = [[], [], [], [], [], [], []]
  hand.each_with_index do |card, index|
    index == 0 ? make_hidden_card(lines) : make_seen_card(lines, card)
  end
  lines.each { |line| puts line.join("  ") }
end

def display_player_cards(hand)
  lines = [[], [], [], [], [], [], []]
  hand.each do |card|
    make_seen_card(lines, card)
  end
  lines.each { |line| puts line.join("  ") }
end

def display_hands(game_data, last = false)
  clear_screen
  display_scores(game_data)
  display_empty_line
  prompt "YOUR CARDS:"
  display_empty_line
  display_player_cards(game_data[:player][:hand])
  display_empty_line
  prompt "DEALER'S CARDS:"
  display_empty_line
  display_dealer_cards(game_data[:dealer][:hand]) if !last
  display_player_cards(game_data[:dealer][:hand]) if last
  display_empty_line
  display_player_total(game_data)
end

def hit_or_stay
  choice = ""
  loop do
    prompt HIT_OR_STAY_MESSAGE
    choice = gets.chomp.to_i
    break if [1, 2].include?(choice)
    prompt "Pick a valid option: 1 or 2."
  end
  choice
end

def compute_total(hand)
  points = hand.map { |card| card[1] }
  number_of_aces = points.count("A")
  points.map! { |val| ["J", "Q", "K"].include?(val) ? val = 10 : val }
  points.map! { |val| ["A"].include?(val) ? val = 11 : val }
  sum = points.inject(&:+)
  sum > MAX_TOTAL ? sum -= number_of_aces * 10 : sum
end

def slice_card!(deck)
  deck.slice!(rand(deck.size))
end

def hit_card!(deck, hand)
  hand << slice_card!(deck)
end

def update_totals(game_data)
  game_data[:player][:total] = compute_total(game_data[:player][:hand])
  game_data[:dealer][:total] = compute_total(game_data[:dealer][:hand])
end

def update_scores(game_data)
  if result(game_data) == :player || result(game_data) == :dealer_busted
    game_data[:player][:score] += 1
  elsif result(game_data) == :dealer || result(game_data) == :player_busted
    game_data[:dealer][:score] += 1
  end
end

def single_hit(deck, choice, game_data)
  if choice == 1
    display_empty_line
    prompt_pause("You hit...")
    hit_card!(deck, game_data[:player][:hand])
  else
    loop do
      break if compute_total(game_data[:dealer][:hand]) >= MAX_TOTAL - 4
      hit_card!(deck, game_data[:dealer][:hand])
      display_hands(game_data)
      sleep(1)
    end
  end
  update_totals(game_data)
end

def round_over?(game_data, choice)
  game_data[:player][:total] > MAX_TOTAL || choice == 2
end

def play_one_round(game_data)
  deck = initialize_deck
  initialize_hands(deck, game_data)
  update_totals(game_data)

  loop do
    display_hands(game_data)
    choice = hit_or_stay
    single_hit(deck, choice, game_data)
    break if round_over?(game_data, choice)

  end
  update_scores(game_data)
  display_hands(game_data, true)
  display_dealer_total(game_data)
  display_result(game_data)
end

def result(game_data)
  dealer_total = game_data[:dealer][:total]
  player_total = game_data[:player][:total]
  if player_total > MAX_TOTAL
    :player_busted
  elsif dealer_total > MAX_TOTAL
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(game_data)
  case result(game_data)
  when :player_busted then prompt "You busted! Dealer wins!"
  when :dealer_busted then prompt "Dealer busted! You win!"
  when :player then prompt "You win!"
  when :dealer then prompt "Dealer wins!"
  when :tie then prompt "It's a tie!"
  end
end

def play_next_round?
  display_empty_line
  prompt "Press enter to play the next round, any other key and enter to quit."
  continue = gets.chomp
  continue.empty?
end

def game_over?(game_data)
  game_data[:player][:score] == WINNING_SCORE ||
    game_data[:dealer][:score] == WINNING_SCORE
end

def display_champion(game_data)
  if game_data[:dealer][:score] == WINNING_SCORE
    prompt "The grand champion is the dealer!"
  elsif game_data[:player][:score] == WINNING_SCORE
    prompt "You are the grand champion! Congratulations!"
  end
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

prompt_welcome
prompt_points_message
prompt_shuffling_cards

loop do
  game_data = { player: { hand: [], total: 0, score: 0 },
                 dealer: { hand: [], total: 0, score: 0 } }

  loop do
    reset_data(game_data)
    play_one_round(game_data)
    break if game_over?(game_data) || !play_next_round?
  end

  display_champion(game_data)
  break unless play_again?
end

display_goodbye
