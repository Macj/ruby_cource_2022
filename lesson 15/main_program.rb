require "./lib.rb"

begin
	Menu.new.rugn
rescue => e
  puts "Sorry something goes wrong. Reload the programm and try again!"
end