
$animal = {
   type:    "", 
   kingdom: "", 
   size:     0, 
   weight:   0, 
   kind:    "", 
   sex:     ""
}

$animals = []

database = "хищник,рыбы,200,150,щука,Femail;
травоядный,рыбы,350,200,карась,Male;
травоядный,рыбы,567,250,карась,Femail;
хищник,рыбы,24,100,окунь,Femail;
травоядный,рыбы,76,110,форель,Male;
хищник,рыбы,89,250,лосось,Femail;
хищник,рыбы,150,150,судак,Male;
травоядный,рыбы,200,1000,ерш,Femail;
хищник,рыбы,123,55,щука,Male;
хищник,рыбы,456,1500,окунь,Male;
хищник,млекопитающее,230,220000,тигр,Male;
хищник,млекопитающее,250,230000,тигр,Femaile;
хищник,млекопитающее,220,210000,лев,Male;
хищник,млекопитающее,210,200000,лев,Femaile;
хищник,млекопитающее,140,65000,гепард,Male;
травоядный,млекопитающее,750,3000000,слон,Femaile;
травоядный,млекопитающее,4420,4000000,носорог,Male;
травоядный,млекопитающее,350,700000,лошадь,Male;
травоядный,млекопитающее,620,900000,жираф,Femaile;
травоядный,млекопитающее,220,359000,зебра,Femaile;
хищник,паукообразные,27,170,птицееед,Femaile;
хищник,паукообразные,12,50,тарантул,Male;
хищник,паукообразные,25,150,птицееед,Male;
хищник,паукообразные,4,17,волк,Femaile;
хищник,паукообразные,1,3,красноспинный,Male;
травоядный,паукообразные,3,15,киплинга,Femaile;
травоядный,паукообразные,5,21,киплинга,Male;
травоядный,паукообразные,2,10,киплинга,Femaile;
травоядный,паукообразные,6,25,киплинга,Male;
травоядный,паукообразные,1,8,киплинга,Femaile;
хищник,пресмыкающиеся,1550,550,зеленая,Femail;
травоядный,пресмыкающиеся,1060,208,угольная,Male;
хищник,пресмыкающиеся,1780,678,среднеазиатская,Femail;
травоядный,пресмыкающиеся,246,879,аргентинская,Femail;
травоядный,пресмыкающиеся,3467,569,лесная,Male;
хищник,пресмыкающиеся,457,370,красноухая,Femail;
хищник,пресмыкающиеся,720,930,болотная,Male;
травоядный,пресмыкающиеся,604,1670,слоновая,Femail;
хищник,пресмыкающиеся,2187,589,греческая,Male;
травоядный,пресмыкающиеся,485,1953,коричневая,Femail"



def set_up_animal(params)
   el = $animal.clone
   el[:type]     = params[0]
   el[:kingdom]  = params[1]
   el[:size]     = params[2]
   el[:weight]   = params[3]
   el[:kind]     = params[4]
   el[:sex]      = params[5]
   el
end

 def set_up_animals(database)
  line_arr = database.split(";\n")
  line_arr.map do |line|
   att = line.split(",")
   att[2] = att[2].to_i
   att[3] = att[3].to_i
   $animals << set_up_animal(att)
   end
 end


def find_biggest(array, type)
   type_animals = array.find_all{|elem| elem[:type] == type}
   type_animals.max_by{|elem| elem[:size]}
end

def find_biggest_animals(animals)
   big_pre = find_biggest(animals, "хищник")
   big_herb = find_biggest(animals, "травоядный")
   puts "самый большой хищник" + big_pre.inspect
   puts "самый большой травоядный" + big_herb.inspect
end

 set_up_animals(database)
find_biggest_animals($animals)

def find_longest(array, sex)
   sex_animals = array.find_all{|elem| elem[:sex] == sex}
   sex_animals.max_by{|elem| elem[:size]}
 end

def find_longest_animals(animals)
    fema = find_longest(animals, "Femail")
    mal = find_longest(animals, "Male")

   puts "самый длинный самец" + mal.inspect
   puts "самая длинная самка" + fema.inspect
end

 find_longest_animals($animals)

#Найти царство с самым большим представителем мужского пола и женского

def find_kingdom(array, sex)
   weight_animals = array.find_all{|elem| elem[:sex] == sex}
   weight_animals.max_by{|elem| elem[:weight]}
end

def find_weight_animals(animals)
   weight_f_f = find_kingdom(animals, "Femail")
   weight_f_m = find_kingdom(animals, "Male")

   puts weight_f_f[:kingdom]
   puts weight_f_m[:kingdom]
end

find_weight_animals($animals)


# Найти вид
# с самым длинным названием 
# и для этого вида найти самую крупную особь

def find_kind_biggest_name(array)
   animal_max_name = array.max_by{|elem| ele[:kind].size}
   serch_kind = animal_max_name[:kind]
   animals_serch_kind = array.find_all{|elem| elem[:kind] == serch_kind}
   animal_big = animals_serch_kind.max_by{|elem| elem[:size]}

   puts "вид с самым длинным названием" + animal_big[:kind]
   puts "а само большое животное:" + animal_big.inspect
end 

find_kind_biggest_name($animals)
   
