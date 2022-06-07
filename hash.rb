# 1) создать хэш с параметрами автомобиля
# 2) создать массив из разных автомобилей
# 3) сделать поиск по этому массиву по характеристикам
#
h1 = {
  brand: 'Honda',
  year: 2005,
  color: 'green',
  type: 'jeep',
  engine: 2.2}

h2 = {
  brand: 'Toyot',
  year: 2006,
  color: 'red',
  type: 'cupe',
  engine: 2.8}

h3 = {
  brand: 'Porshe',
  year: 2010,
  color: 'green',
  type: 'crossover',
  engine: 4.4}

h4 = {
  brand: 'Hunday',
  year: 2000,
  color: 'blue',
  type: 'universal',
  engine: 2.0
}

puts h4[:brand]

cars = [h1,h2,h3,h4]

puts "Max engine: " + cars.max_by{|e| e[:engine]}.inspect
puts "Min year: " + cars.min_by{|e| e[:year]}.inspect
puts "All not green: \n" + cars.find_all {|e| e[:color] != 'green' && e[:engine] > 2.2}.join("\n")



$animal = {
  type:     "", #(хищник, травоядный)
  kingdom:  "", # (млекопитающее, пресмыкающиеся, паукообразные, рыбы)
  size:     0,  # (размер в сантиметрах)
  weight:   0,  # (вес в граммах)
  kind:     "", # (название вида: слоны, обезьяны, акулы и тд)
  sex:      ""  # Male / Femail | M / F | 0|1
}
# $animals = []

data = "хищник,рыбы,2000,15000,скат,M;
хищник,рыбы,128,1340,скат,M;
хищник,рыбы,2000,15000,скат,M;
хищник,рыбы,2000,15000,скат,Ж;
хищник,рыбы,2000,15000,скат,Ж;
хищник,рыбы,2000,15000,скат,Ж;
"
def set_up_animal(params) #(type, kingdom, size, weight, kind, sex)
  elem = $animal.clone
  elem[:type]     = params[0]
  elem[:kingdom]  = params[1]
  elem[:size]     = params[2]
  elem[:weight]   = params[3]
  elem[:kind]     = params[4]
  elem[:sex]      = params[5]
end

def set_up_animals(data)
  line_arr = data.split(';')
  line_arr.map do |line|
    attr = line.split(",")
    attr[2] = attr[2].to_i
    attr[3] = attr[3].to_i
    set_up_animal(attr)
  end
end

animals = set_up_animals(data)

def find_biggest(array, type)
  type_animals = array.find_all{|el| el[:type] == type }
  type_animals.max_by{|el| el[:size] }
end

big_pre = find_biggest(animals,'хищник')
big_herb = find_biggest(animals,'травоядный')
puts "Самый большой хищник " + big_pre.inspect
puts "Самый большой травоядный " + big_herb.inspect

def find_longest(array, sex)

end



puts "Longest Femail:" + find_longest(animals,'Ж').inspect









fish_1 = set_up('хищник', 'рыбы', 2000, 15000, 'скат', 'M')
fish_2 = set_up('травоядный', 'рыбы', 20, 15000, 'Камбала', 'M')
fish_3 = set_up('хищник', 'рыбы', 300, 15000, 'скат', 'M')
fish_4 = set_up('травоядный', 'рыбы', 1568, 15000, 'скат', 'M')
fish_5 = set_up('хищник', 'рыбы', 1234, 15000, 'скат', 'M')
fish_6 = set_up('травоядный', 'рыбы', 18, 15000, 'скат', 'Ж')
fish_7 = set_up('хищник', 'рыбы', 198, 15000, 'скат', 'Ж')
fish_8 = set_up('травоядный', 'рыбы', 56, 15000, 'скат', 'Ж')
fish_9 = set_up('хищник', 'рыбы', 2534, 15000, 'скат', 'Ж')
fish_10 = set_up('травоядный', 'рыбы', 122, 15000, 'скат', 'Ж')

animals << [fish_1, fish_2, fish_3, fish_4, fish_5, fish_6, fish_7, fish_8, fish_9, fish_10]