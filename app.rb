require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|             Bienvenue sur MORPION             |"
puts "|     Le but du jeu est d'aligner 3 cases       |"
puts "-------------------------------------------------"
puts "Donne un prénom au joueur 1"
print "> "
player1 = gets.chomp
puts "Donne un prénom au joueur 2"
print "> "
player2 = gets.chomp
game = Game.new(player1,player2)

play = "y"
play_number = 1
while play == 'y'
  puts "  ---------------Partie #{play_number}--------------- "
  puts game.board
  while game.is_still_ongoing?
    puts "\n"
    puts "#{player1}, où souhaites-tu jouer ?".colorize(:green)
    action_1 = gets.chomp
    until game.action_choice_possible(action_1)
      puts 'Ce coup est impossible'
      action_1 = gets.chomp
    end
    game.action_p1(action_1)
    puts game.board
    if game.is_still_ongoing? == false then break end
    puts "#{player2}, où souhaites-tu jouer ?".colorize(:red)
    action_2 = gets.chomp
    until game.action_choice_possible(action_2)
      puts 'Ce coup est impossible'
      action_2 = gets.chomp
    end
    game.action_p2(action_2)
    puts game.board
  end
  game.end
  puts "Voulez-vous faire une nouvelle partie ? (y/n)"
  print "> "
  play = gets.chomp
  until play == 'y' || play == 'n' || play == 'N' || play == 'Y'
    puts "Je n'ai pas compris"
    play = gets.chomp
  end
  play_number += 1
  game.new_game
end
