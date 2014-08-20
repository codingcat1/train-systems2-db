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

def lines_menu
  puts "*** WELCOME TO LINES MENU ***\n\n"
  puts "Press '1' to add a line"
  puts "Press '2' to list all lines"
  puts "Press 'x' to return to main menu"
  puts "\n\n"
  lines_choice = gets.chomp
  if lines_choice == '1'
    add_line
  elsif lines_choice == '2'
    list_lines
  elsif lines_choice == 'x'
    main_menu
  else
    puts "Not a valid entry\n\n"
    sleep(1)
    lines_menu
  end
end

def add_line
  puts "*** NEW LINE ***"
  puts "Enter your line name:"
  line_input = gets.chomp
  new_line = Line.new(:name => line_input)
  new_line.save
  puts "* #{new_line.name.upcase} * has been saved to your lines table.\n\n"
  sleep(0.5)
end

def list_lines
  puts "Heres a list of your lines"
   Line.all.each do |line|
     puts "#{line.name}"
   end
end


main_menu

