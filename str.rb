# 1)+ ВВести строку с клавиатуры
# 1.1)
# +Найти длину строки,
# +перебрать символы строки по разным условиям,
#  - все 'а' заменить на 'А'
# 1.2)изменить строку
# +на все заглавные буквы
# +все прописные буквы
# напистаь ее с большой буквы
#
# 2)+ разделить строку на части по символу-разделителю ":"
# 3)+ найти вхождение одной строки в другу строку

puts "Enter string"
str = gets
puts "Size of a String: " + (str.size).to_s

def switch_char(str, from, to)
  for i in (0...str.size)
    if str[i].chr == from
      str[i] = to
    end
  end
  str
end
# puts "Change 'a' on 'A': " + switch_char(str, 'a', 'A')
puts "Delete 'a' from str: " + str.tr('a', '')

puts "1.2 Upcase for str: " + str.upcase
puts "1.2 Downcase for str: " + str.downcase
puts "1.2 Сapitalize for str: " + str.capitalize

str_array = str.split(":")
puts "2) Split str on ':' symbol: "
puts str_array

puts str_array.first.center(30, '*').chars.inspect

puts "3 Position Substr 'ketty' in str: " + str.index('ketty').inspect


