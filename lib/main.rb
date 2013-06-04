require_relative 'game'
require_relative 'word'

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

