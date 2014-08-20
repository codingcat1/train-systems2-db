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
  elsif lines_choice == '3'
    add_station
  elsif lines_choice == '4'
    list_stations
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

def stations_menu
  puts "*** WELCOME TO STATIONS MENU ***\n\n"
  puts "Press '1' to add a station"
  puts "Press '2' to list stations"
  puts "Press '3' to add a station to a line"
  puts "Press 'x' to return to main menu"
  puts "\n\n"
  stations_choice = gets.chomp
  if stations_choice == '1'
    add_station
  elsif stations_choice == '2'
    list_stations
  elsif stations_choice == '3'
    add_station_line
  elsif stations_choice == 'x'
    main_menu
  else
    puts "Not a valid entry\n\n"
    sleep(1)
    stations_menu
  end
end

def add_station
  puts "*** NEW STATION ***"
  puts "enter your station name:"
  station_input = gets.chomp
  new_station = Station.new(:name => station_input)
  new_station.save
  puts "* #{new_station.name.upcase} * has been saved to your stations table.\n\n"
end

def list_stations
  puts "Heres a list of your stations"
  Station.all.each do |station|
    puts "#{station.name}"
  end
end

# def add_station_line
#   puts "enter the line you want to add a station to:"
#   station_input = gets.chomp
#   if station_input = lines


# def find_station(input)
#   Station.all do |station|
#     if station.name == name
#       @result = station
#     end
#   end
#   @result
# end

# station_id = find_station(input).id
# line_id = find_line(input).id

# Stop.new(station_id: station_id, line_id: line_id)

main_menu


