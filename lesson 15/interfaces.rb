#       Список иниерфейсов
#       очередность реализации модулей #
# 1 модуль работы с животными
class AnimalList
# ### структуры данных :
# -животное
# {
#            type:    "",
#            kingdom: "",
#            size:     0,
#            weight:   0,
#            kind:    "",
#            sex:     ""
#         }
# -массив животных
# -maccив масивов параметров
# params_map = [
# 	['травоядный','рыбы',350,200,'карась','Male'],
# 	['травоядный','рыбы',567,250,'карась','Femail'],
# 	['хищник','рыбы',24,100,'окунь','Femail']
# ]
# --------------------------------
# ### функции
# **Init
# -создание животного из массива
def create_animal(params)
# -создание списка животных
def create_animals(params_map)
# -создать его из текст файла
def create_animals_from(file_name)
# **алг задачи
# -Найти самого большого хищника и самого большого травоядного
def biggest_animal
def biggest_animal_by(type)
# -Найти самую длинную самку и самца
def longest_animal
def longest_animal_for(sex)
# -Найти царство с самым большим представителем мужского пола и женского
def biggest_animal_kingdom
# -Найти вид с самым длинным названием и для этого вида найти самую крупную особь
def animal_with_longest_kind_name

 private


#
# 2 работа с файлами
 class AnimalParser
# ###Data:
# `название файла`
 @file_name
# ###functions
# -считать из файла данные и преобразовать
def parse_animal_data_from_file
# -преобразовать текст в структуры данных
def parse_animal_data_from_text
# -преобразовать структуры данных в текс
def convert_animals_to_text
# -сохранить текст в файл
def write_animals_data_to(file_name = nil)

#
# 3 вывод информации

# ***Data:
@animal_list
#
# *** functions
# -вывод животного
def show(animal)
# -выводить много животных
def show_animals
#  -вывести конкретное животное из списка
def show_animal_by(index)
#
# 4 управляющий модуль
#
#
# 5 меню
#  ***Data
# - string of user choice
@choice
#
# ***functions
#-вывести варианты действий(меню)
def show_menu
# -получить выбор пользователя
def get_choice
# -обработать выбор пользователя, вызвав управляющий модуль
def handle_choice
# -в цикле запрашивать выбор
def run
#