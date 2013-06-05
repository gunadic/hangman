require 'pry'

require_relative 'game'
require_relative 'word'

@guessed_letters = []
@puzzle = Word.new


def check_num_players (input)
  (1..5).include?(input.to_i)
end

def get_secondary_input
  puts "Please enter a number between 1 and 5"
  player_count = gets.chomp
  if check_num_players(player_count)==false
    get_secondary_input
  else
    return player_count
  end
end

def get_guess
  print "Guess a letter: "
  guess = gets.chomp
end

def already_guessed(input)
  if @guessed_letters.index(input) != nil
    true
  else
    @guessed_letters << input
    false
  end
end

def print_board
  puts @puzzle.display_array.join(" ")
end

def process_guess(guess, name)
  if guess == "!"
    print "So, what do you think the word is? "
    answer_attempt = gets.chomp.downcase
    if answer_attempt == @puzzle.the_word
      puts "Congratulations #{name}, you've won!"
      exit 1
    else
      puts "Nope."
    end
  else
    if already_guessed(guess) == true
      puts "That letter has already been guessed.\n"
    elsif @puzzle.check_guess(guess) == true
      puts "Yes, #{guess} is in the puzzle.\n"
      if @puzzle.check_full == true
        print_board
        puts "Congratulations #{name}, you've won!"
        puts "Took you long enough!"
        exit 1
      end
    else
      puts "No, #{guess} is not in the puzzle.\n"
    end
  end
end


puts "How many players do you want?"

player_count = gets.chomp

if check_num_players(player_count) == false
  player_count = get_secondary_input
end

setup = Game.new(player_count)

setup.num_players.times do |i|
  result = false
  while !result
    puts "What is player #{i+1}'s name?"
    result = setup.add_player(gets.chomp)
    if !result
      puts "Name has already been taken"      
    end
  end
end

puts "Ok! Lets play!"

while @puzzle.display_array.index("_")!=nil
  setup.shuffle_turn.each do |name| 
    print_board
    puts ""
    print "#{name}, enter a letter, or enter ! to solve: "
    process_guess(gets.chomp, name)
    puts ""
    puts "---next player---"
    puts ""
  end
end
