# Создать программу, ruby
#
# которая будет давать пользователя
# (ok)выбор действий (MENU)
#
# по анализу списка животных (animals_list)
# (ок) создание списка
# (ok)работа со списком елементов в ruby (array)
#
# (ok) СТруктура животного такая-то {name: "", kingdom: "",kind: "" } (animal)
# (ok)КАК в ruby работают над структурами
#
# Необходимо дать возможность:
# - 1) (ok) создать животное                       (Работа с клавиатурой)
# - 2) (ok) вывести животное                       (Работа с выводом данных)
# - 3) (ok) вывести всех созданных животных        (перебор массива - цикл)
# - 4) (ok) загрузить животных из файла            (Работа с файлом)
# - 5) (ok)найти самого крупного                  (поиск и нахождение максимума)
# - 6) (ok)самого мелкого                         (-/- минимума)
# - 7) (ok)найти kind с самым длинным названием   (узнать длину строки) работа со строками
# - 8) (ok)Найти kingdom с самым крупным жив.     (работа с структурой и ключами)
# ...
#
# Service to work with files
class AnimalLoggerService
  def initialize(file_name)
    @file_name = file_name
  end

  # как расшифровать данные из вайла и превратить
  # в массив параметров
  def parse_data_from_file
    animal_data = IO.read(@file_name)
    animal_lines = animal_data.split(";\n")
    animal_lines.map do |line|
      line.split(",")
    end
  end

  def make_animal_record(animal)
    animal.values.join(", ") + ";\n"
  end

  def write_animals_log_to_file(animals)
    File.open(@file_name, 'w') do |file|
      animals.each do |animal|
        animal_line = make_animal_record(animal)
        file.write animal_line
      end
    end
  rescue => err
    puts "Don`t worry. We will fix it!"
    puts err.message
  end

  def append(animal)
    animal_line = make_animal_record(animal)
    File.open(@file_name, 'a') do |file|
      file.puts animal_line
    end
  end
end

# Service to create animal and animal`s list
class CreateAnimalService
  # как выглядит одно животное
  def initialize
    @animal = { name: "", kingdom: "", kind: "" }
  end

  # как создать одно животное
  def create_animal(values)
    obj = @animal.clone
    obj[:name] = values[0]
    obj[:kind] = values[1]
    obj[:kingdom] = values[2]
    obj
  end

  # как создать массив животных
  def make_animals_form_array(data)
    data.map do |values|
      create_animal(values)
    end
  end

  # как получить параметры из файла
  # и создать животных по извесной схеме
  def upload_animals_from_file(file_name)
    animal_logger = AnimalLoggerService.new(file_name)
    data = animal_logger.parse_data_from_file
    make_animals_form_array(data)
  end
end

# Service to decorate animal
class AnimalDecorator
  def show_animal(animal)
    puts "Name: "     + get_valid_value(animal[:name])
    puts "Kingdom: "  + get_valid_value(animal[:kingdom])
    puts "Kind: "     + get_valid_value(animal[:kind])
    puts '________________________'
  end

  def show_animal_list(animals)
    animals.each {|animal| show_animal(animal) }
  end

  private
  def get_valid_value(value)
    # (value.nil?) ? "" : value
    if !value.is_a?(String) || value.nil?
      ""
    else
      value
    end
  end
end

# Animal search logic
class AnimalAnalyzer
  attr_accessor :animals

  def initialize(animals)
    @animals = animals
  end
  # - 5) найти самого крупного                  (поиск и нахождение максимума)
  def find_biggest

  end
  # - 6) самого мелкого                         (-/- минимума)
  def find_smallest

  end
  # - 7) найти kind с самым длинным названием   (узнать длину строки) работа со строками
  def find_lorgest_kind_name

  end
  # - 8) Найти kingdom с самым крупным жив.     (работа с структурой и ключами)
  def find_kingdom_with_biggest
    find_biggest[:kingdom]
  end

end

# Class to control work process
class EcoSystem
  attr_accessor :source_file

  def initialize(source_file)
    @source_file = source_file
    @animals = load_animals
    @creator = CreateAnimalService.new
    @show_master = AnimalDecorator.new
    @analyzer = AnimalAnalyzer.new(@animals)
  end

  # Store data and manipulate
  def load_animals
    @creator.upload_animals_from_file(@source_file)
  end

  def add_animal(attrs)
    @animals << @creator.create_animal(attrs)
  end

  def store
    # write_animals_log_to_file
  end

  # Decoration
  def show_animal(animal)
    @show_master.show_animal(animal)
  end

  def show_all_system
    @show_master.show_animal_list(@animals)
  end

  # logic part
  def show_biggest
    update
    biggest = @analyzer.find_biggest
    show_animal(biggest)
  end

  def show_smallest
    update
    smallest = @analyzer.find_smallest
    show_animal(smallest)
  end

  def find_lorgest_kind_name
    update
    @analyzer.find_lorgest_kind_name
  end

  def find_kingdom_with_biggest
    update
    @analyzer.find_kingdom_with_biggest
  end

  def reload
    @animals = load_animals
    update
  end

  private
  # update animals for analyzer
  def update
    @analyzer.animals = @animals
  end


end

# MENU to handle behaviour
class Menu
  def show_menu
    puts `clear`
    puts "Сделайте выбор  "
    puts "1) создать животное "
    puts "3) вывести всех созданных животных"
    puts "4) загрузить животных из файла"
    puts "5) найти самого крупного"
    puts "6) самого мелкого"
    puts "7) найти kind с самым длинным названием"
    puts "8) Найти kingdom с самым крупным жив."
  end

  def get_user_choice
    gets.chomp.to_i
  end

  def handle_user_choice
    main_system = EcoSystem.new('Savanna.yaml')
    show_menu
    case get_user_choice
    when 1 # создать животное
      puts "создать животное"
      params = gets.chomp.split(',')
      main_system.add_animal(params)
      # Uploader
    when 3 # вывести всех созданных животных
      puts "3) вывести всех созданных животных"
      main_system.show_all_system
      # Decor
    when 4 # загрузить животных из файла
      puts "4) загрузить животных из файла"
      file_name = gets.chomp
      main_system.source_file = file_name
      main_system.reload
      # Uploader or Factory
    when 5 # найти самого крупного
      puts "5) найти самого крупного"
      main_system.show_biggest
      # logic
    when 6 # самого мелкого
      puts "6) самого мелкого"
      main_system.show_smallest
      # logic
    when 7 # найти kind с самым длинным названием
      puts "7) найти kind с самым длинным названием"
      main_system.find_lorgest_kind_name
      # logic
    when 8 # Найти kingdom с самым крупным жив
      puts "8) Найти kingdom с самым крупным жив."
      main_system.find_kingdom_with_biggest
      # logic
    when 0
      false
    else
      puts "Wrong number try one more time!"
    end
  end
end

prog = Menu.new

work = true
while work
  work = prog.handle_user_choice
end