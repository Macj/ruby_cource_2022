
params_map = [
	['травоядный','рыбы',350,200,'карась','Male'],
	['травоядный','рыбы',567,250,'карась','Femail'],
	['хищник','рыбы',24,100,'окунь','Femail']
]


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
	def initialize(params_map)
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
  def create_animals_from(params_map)
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

class ControlModule
	def find_biggest_animals(animals)
	   big_pre = find_biggest(animals, "хищник")
	   big_herb = find_biggest(animals, "травоядный")
	   puts "самый большой хищник" + big_pre.inspect
	   puts "самый большой травоядный" + big_herb.inspect
	end

	def find_kind
		puts "вид с самым длинным названием:"+animal_big[:kind]
	  puts "а само большое животное:" + animal_big.inspect
	 end
	end
	 # def find_longest_animals(animals)
#     fema = find_longest(animals, "Femail")
#     mal = find_longest(animals, "Male")

#    puts "самый длинный самец" + mal.inspect
#    puts "самая длинная самка" + fema.inspect
# end

#  find_longest_animals($animals)

# #Найти царство с самым большим представителем мужского пола и женского



# def find_weight_animals(animals)
#    weight_f_f = find_kingdom(animals, "Femail")
#    weight_f_m = find_kingdom(animals, "Male")

#    puts weight_f_f[:kingdom]
#    puts weight_f_m[:kingdom]
# end

# find_weight_animals($animals)


# # Найти вид
# # с самым длинным названием 
# # и для этого вида найти самую крупную особь



# find_kind_biggest_name($animals)
   


# end
end