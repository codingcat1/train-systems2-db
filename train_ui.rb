require './lib/line'
require './lib/station'
require './lib/stop'
require 'pg'

DB = PG.connect({:dbname => 'test_train_system'})

def main_menu
  loop do
    puts "*** WELCOME TO TRAIN SYSTEM ***\n\n"
    puts "Press 'l' for train lines"
    puts "Press 's' for train stations"
    puts "Press 'o' for train stops"
    puts "Press 'x' to exit"
    puts "\n\n"
    main_choice = gets.chomp
    if main_choice == 'l'
      lines_menu
    elsif main_choice == 's'
      stations_menu
    elsif main_choice == 'o'
      stops_menu
    elsif main_choice == 'x'
      puts "*** Thanks, good-bye ***\n\n"
      sleep(1.5)
      system 'clear'
      exit
    else
      puts "That is not a valid input\n\n"
      sleep(1.5)
      system 'clear'
    end
  end
end


main_menu

