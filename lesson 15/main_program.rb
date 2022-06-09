class AnimalParser
	def initialize(file_name)
		@file_name = file_name
	end

	def parse_animal_data_from_file
		text = IO.read(@file_name)
		parse_animal_data_from(text)
	end

	def convert_animals_to_text(animals)
		lines = animals.map{|animal|
			convert_animal_to_text(animal)
		}
		lines.join(";\n")
	end

	def write_animals_data_to(file_name = nil)
		file = file_name.nil? ? @file_name : file_name
		text = convert_animals_to_text(animals)
		File.open(file, 'w'){ |f| f.write text}
	end

	private

	def parse_animal_data_from(text)
		lines = text.split(";\n")
		lines.map {|line|
			params = line.split(",")
			params[2] = params[2].to_i
			params[3] = params[3].to_i
			params
		}
	end

	def convert_animal_to_text(animal)
		"#{animal.values.join(",")}"
	end

end

class AnimalList
	def initialize()
		@animal = {
		   type:    "", 
		   kingdom: "", 
		   size:     0, 
		   weight:   0, 
		   kind:    "", 
		   sex:     ""
		}
	  @animals = []
  end
	# i
	def create_animal(params)	
		element = @animal.clone
	  element[:type]     = params[0]
	  element[:kingdom]  = params[1]
	  element[:size]     = params[2]
	  element[:weight]   = params[3]
	  element[:kind]     = params[4]
	  element[:sex]      = params[5]
	  element
	end
	# support method
	def make_animals_array(params_map)
		params_map.map do |params|
  	  create_animal(params)
  	end
	end
	# i
	def create_animals_from_array(params_map)
		@animals = make_animals_array(params_map)
	end
	# i
	def create_animals_from(file_name)
		parser = AnimalParser.new(file_name)
		params_map = parser.parse_animal_data_from_file
		# @animals = make_animals_array(params_map)
		create_animals_from(params_map)
	end

	# logic
	# i
	def find_biggest(type)
	   type_animals = @animals.find_all{|elem| elem[:type] == type}
	   type_animals.max_by{|elem| elem[:size]}
	end
	# i
	def find_longest(type)
	   sex_animals = @animals.find_all{|elem| elem[:type] == type}
	   sex_animals.max_by{|elem| elem[:weight]}
	end
	# i
	def find_kingdom(sex)
	   weight_animals = @animals.find_all{|elem| elem[:sex] == sex}
	   weight_animals.max_by{|elem| elem[:weight]}
	end
	# i
	def find_kind_biggest_name_animal
	  animal_max_name = @animals.max_by{|elem| elem[:kind].size}
	  serch_kind = animal_max_name[:kind]
	  animals_serch_kind = @animals.find_all{|elem| elem[:kind] == serch_kind}
	  animal_big = animals_serch_kind.max_by{|elem| elem[:size]}
	  animal_big 
	end
end

 class Decorator
	def initialize(animal_list)
		@animal_list = animal_list
	end

	# -вывод животного
	def show(animal)
		puts "------"
		animal.each do |key,val|
			puts "#{key}: #{val}"
		end
		puts "======="
	end
	# -выводить много животных
	def show_animals
		@animal_list.each do |animal|
			show(animal)
		end
	end
	#  -вывести конкретное животное из списка
	def show_animal_by(index)
		show(@animal_list[index])
	end
end

# 4)Управляющий модуль
# -Использует другие модули для решения поставленных задач

# 	 Найти самого большого хищника и самого большого травоядного
#    Найти самую длинную самку и самца
#    Найти царство с самым большим представителем мужского пола и женского
#    Найти вид с самым длинным названием и для этого вида найти самую крупную особь

class ControlModule
	def initialize
		@file_name = ""
		@animal_list = AnimalList.new()
		@animal_parser = AnimalParser.new(@file_name)
		@decor = Decorator.new(@animal_list)
	end

	def create_animals_from_array(params_map)
		@animal_list.create_animals_from_array(params_map)
	end

	def create_animals_from_file(file_name)
		@file_name = file_name
		@animal_list.create_animals_from(@file_name)
	end

	def show(animal)
		@decor.show(animal)
	end

	def results_for_biggest
		big_predators = @animal_list.find_biggest('хищник')
		big_herb = @animal_list.find_biggest('травоядный')
		    
		show(big_predators)
		show(big_herb)
	end

	def results_for_longest
		fema = @animals_list.find_longest('Femail')
		male = @animals_list.find_longest('Male')

		show(fema)
		show(male)
	end

	def results_for_kingdom_biggest
		kingdom_big_male = @animals_list.find_kingdom_with_biggest('Male')
		kingdom_big_female = @animals_list.find_kingdom_with_biggest('Female')
		puts kingdom_big_male.[](:kingdom)
		puts kingdom_big_female[:kingdom]
	end

	def results_find_kind_big_name
		big_animal_with_big_kind = @animals_list.find_king_with_biggest_name
		puts big_animal_with_big_kind[:kind]
		show(big_animal_with_big_kind)
	end
end

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
	 		10 - Самый большой хищник и самый большой травоядный \n 
			11 - Самый длинный самец и самая длинная самка \n 
			12 - Царство с самым большим самцом и царство с самой большой самкой \n
			13 - Вид с самым длинным названием и самая крупная особь этого вида \n"
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
		when 1
			@cont_module.create_animals_from_array(@params_map)
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