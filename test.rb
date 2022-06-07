# Ввести целочисленный массив
puts "Enter array with coma as spliter."
a = gets.chomp
puts a.inspect
a = a.split(",")
puts a.inspect
a = a.map{ |str|
  str.to_i
}
puts a.inspect

# найти максимум из него
max = a[0]

a.each do |elem|
  max = elem if elem > max
end
# вывести
puts "Max element from array is: #{ max }"
