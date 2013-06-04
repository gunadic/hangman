require 'pry'

require_relative 'game'
require_relative 'word'

@guessed_letters = []

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
puzzle = Word.new

puts puzzle.display_array.join(" ")

setup.shuffle_turn.each do |name| 
  puts "#{name}, it's your turn!"
  print "Guess a letter, or enter ! to solve: "
  guess = gets.chomp
  if already_guessed(guess) == true
    puts "You've already guessed that letter."
  else
    if puzzle.check_guess(guess) == true
      puts "Yes, #{guess} is in the puzzle"
      puts puzzle.display_array.join(" ")
    end
  end
end
