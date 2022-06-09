require "./lib.rb"


# 6)Меню
# -вводить данные от пользователя
# -выводить результат действия

class Menu
	def initialize
		@choice = "100"
		@params_map = [
			['травоядный','рыбы',350,200,'карась','Male'],
			['травоядный','рыбы',567,250,'карась','Femail'],
			['хищник','рыбы',24,100,'окунь','Femail']
		]
		@default_file = "./animals.txt"
		@cont_module = ControlModule.new
	end

#-вывести варианты действий(меню)
	def show_menu
		puts `clear`
	 	puts"
			0 - load animals from file \n
			1 - load animals from array \n
			2 - show all animals \n
			3 - show animal by index \n
	 		10 - Самый большой хищник и самый большой травоядный \n 
			11 - Самый длинный самец и самая длинная самка \n 
			12 - Царство с самым большим самцом и царство с самой большой самкой \n
			13 - Вид с самым длинным названием и самая крупная особь этого вида \n
			exit - выход"
	end
	# -получить выбор пользователя
	def get_choice
	  @choice = gets.chomp
	end
	# -обработать выбор пользователя, вызвав управляющий модуль
	def handle_choice()
	 	case @choice.to_i
		when 0
			puts 'enter file name or empty for default'
			file_str = gets.chomp
			file_name = file_str.empty? ? @default_file : file_str
			@cont_module.create_animals_from_file(file_name)
			puts "Animals created"
		when 1
			@cont_module.create_animals_from_array(@params_map)
		when 2
			@cont_module.show_all_animals
		when 3
			puts 'enter index of animal'
			index = gets.chomp.to_i
			@cont_module.show_animal_by(index)
		when 10
			@cont_module.results_for_biggest
		when 11
			@cont_module.results_for_longest
		when 12
			@cont_module.results_for_kingdom_biggest
		when 13
			@cont_module.results_find_kind_big_name
		when 100
			puts "Hi there!! Let`s begin"             
		else 
		    puts "Wrong choice try agane"             
		end
		puts "Enter to continue:"
		gets.chomp
	end

	def run
		while @choice != 'exit'
			handle_choice
			show_menu
			get_choice
		end
	end

end


Menu.new.run