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
  attr_accessor :animals, :animal

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
		create_animals_from_array(params_map)
	end

	# logic
	# i
	def find_biggest(type)
	   type_animals = @animals.find_all{|elem| elem[:type] == type}
	   type_animals.max_by{|elem| elem[:size]}
	end
	# i
	def find_longest_by(sex)
	   sex_animals = @animals.find_all{|elem| elem[:sex] == sex}
	   sex_animals.max_by{|elem| elem[:weight]}
	end

	# i
	def find_kingdom_with_biggest(sex)
	   weight_animals = @animals.find_all{|elem| elem[:sex] == sex}
	   weight_animals.max_by{|elem| elem[:weight]}
	end
	# i
	def find_king_with_biggest_name
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

	#interface
	def show_animals_count
		print "Animals count: #{animals.count}\n"
	end

	# -вывод животного
	def show(animal)
		puts "------"
		if animal.nil?
			puts "Empty data"
		else
			animal.each do |key,val|
				puts "#{key}: #{val}"
			end
		end
		puts "======="
	end

	#  -вывести конкретное животное из списка
	def show_animal_by(index)
		show(animals[index])
	end

	# -выводить много животных
	def show_animals
		animals.each do |animal|
		  show(animal)
		end
	end
	def show_animals_table
		table_head
		table_body
	end

	private

	#support
	def animal
		@animal_list.animal
	end
	def animals
		@animal_list.animals
	end

	### table part
	def new_line
		print "\n"
	end

	def column_separator
		print "|"
	end

  # форматированная строка которая всегда 15 символов в длинну
  # не завсимо от значения el
	def formated_table_cell(el,i)
		tab_number = (i == 0) ? 5 : 15
		printf " %-#{tab_number}s", el.to_s
	end

	# блок таблицы со значением и разделителем
	# пример `хищники    |` или `15     |`
	def formated_table_block(el,i)
		formated_table_cell(el,i)
		column_separator
	end

  def table_line(list)
		column_separator
  	list.each_with_index do |el, i|
  		formated_table_block(el, i)
  	end
  	new_line
  end

  def separator_line
  	columns_count = animal.keys.count + 1
  	column_size = 17
  	screen_columns_count = columns_count * column_size - 10
  	screen_columns_count.times {print "-"}
  	new_line
  end

  def table_head
  	show_animals_count
		separator_line
  	
  	keys = [:index] + animal.keys
  	table_line(keys)

		separator_line
  end

  def table_body
 		animals.each_with_index do |animal, index|
 			values = [index] + animal.values
 			table_line(values)
 		end
		separator_line
  end
	### end table part
end

# 4)Управляющий модуль
# -Использует другие модули для решения поставленных задач

# 	 Найти самого большого хищника и самого большого травоядного
#    Найти самую длинную самку и самца
#    Найти царство с самым большим представителем мужского пола и женского
#    Найти вид с самым длинным названием и для этого вида найти самую крупную особь

class ControlModule
	# initialization
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

	#dicoration
	def show(animal)
		@decor.show(animal)
	end

	def show_all_animals
		@decor.show_animals_table
	end

	def show_animal_by(index)
		@decor.show_animal_by(index)
	end

	# logic
	def results_for_biggest
		big_predators = @animal_list.find_biggest('хищник')
		big_herb = @animal_list.find_biggest('травоядный')
		    
		show(big_predators)
		show(big_herb)
	end

	def results_for_longest
		fema = @animal_list.find_longest_by('Femail')
		male = @animal_list.find_longest_by('Male')

		show(fema)
		show(male)
	end

	def results_for_kingdom_biggest
		kingdom_big_male = @animal_list.find_kingdom_with_biggest('Male')
		kingdom_big_female = @animal_list.find_kingdom_with_biggest('Femail')
		puts kingdom_big_male.[](:kingdom) if kingdom_big_male
		puts kingdom_big_female[:kingdom] if kingdom_big_female

		puts "Empty data for kingdom_big_female" if kingdom_big_female.nil?
		puts "Empty data for kingdom_big_male" if kingdom_big_male.nil?
				
	end

	def results_find_kind_big_name
		big_animal_with_big_kind = @animal_list.find_king_with_biggest_name
		puts big_animal_with_big_kind[:kind]
		show(big_animal_with_big_kind)
	end
end
