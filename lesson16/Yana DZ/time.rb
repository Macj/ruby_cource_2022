# Задача:
#   - сделать программу котора считает дни и часы до конкретной даты.
#   - дата вводится пользователем
# Алгоритм решения задачи
# 1. ввод данных
# - Формат вводных данных - 01.06.2022:название события
# -разпознать9распарсить0 данные
# 2.прописать сегодня
# - от будущей даты - сегодня
# преобразить в красивый вид
# 3.вывисти
# итерфейс
#   str = get_data()
#   pars_data(str)
#   date,name = pars_data
#   to_day = retort_to_day
#   des = date - to_day
#   show_days(des)
#

require 'time'
require 'date'
require './helper.rb'

def get_data
  puts "Please enter your date in this form: 04.06.2022 | Happy Birthday "
  gets.chomp
end

def parse_data(str)
  date_str, name = str.split("|")
  date = Time.parse(date_str)
  [date, name]
end

def days_to(date)
  (Date.parse(date.to_s) - Date.today).round
end

def hours_to(date)
  time_difference = date - now
  (time_difference.to_i / hour)
end

def show(date)
  date.strftime("%d.%m.%Y %H:%M")
end

str = get_data
date, name = parse_data(str)
days = days_to(date)
hours = hours_to(date)
puts "До события #{name}( #{show(date)} )
осталось #{time_line(days, :days_str)}
 или #{time_line(hours, :hours_str)}"



