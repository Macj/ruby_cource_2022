# DRY don`t repeat Youself
#
# найти большее из 5 чисел
#
arr = [1,3,5,2,6,8,10]

def max_from(arr)
  max = 0; arr.each { |val| max = val if max < val }
end

puts "Maximum: #{max_from(arr)}"

# находить элементы по цвету в разных местах


toys = [
  {name: "car", color: 'red'},
  {name: 'horse', color: 'white'},
  {name: 'foot ball', color: :yellow}]

def all_toys_by_color(toys, color)
  toys.select{ |toy| toy[:color] == color }
end

def show_all_toys_by_color(toys, color )
  toys = all_toys_by_color(toys, color)
  puts toys
end

['green', 'red', 'yellow'].each { |color|
  show_all_toys_by_color(toys, color)
}

# KISS
# разбить строку по разделителю

# Надо проверять все символы на соответствие с массивом допустимых разделителей
# Надо проверять строку на допустимую длину
# Надо проверять страку на содержание слцжебных символов
# Надо проверять язык раскладки на которой написали строку
# и в конце если все хорошо разделить строку по символу

# DO NOT DO THAT HARD
class Separator
  def initialize(str, symbol)

  end

  def split_str

  end

  private
  def validate_symbol

  end
  def validate_str

  end

  def get_str_language

  end
end

# KEEP IT SIMPLE, STUPID
def split(str, symbol)
  result = [] # ["abcnsdfj", "", ""]
  cur = ""
  str.each do |chr|
    if chr == symbol
      result << cur
      cur = ""
    else
      cur += ch
    end
  end
end



# SOLID
#
# Single Responsibility Principle (Принцип единственной ответственности).
#
# Bad
module Fly
  @wings = ""
  @engine = ""
  @fuel_level = 0
  def fly_up

  end
  def ground_down

  end
  def wing

  end
  def glide

  end
  def need_to_wing?

  end
  def can_glide?

  end
  def need_to_ground_down?

  end

  def fuel_pump

  end
  def engin_start

  end

  def flying
    fuel_pump
    engin_start
    fly_up
    wing if need_to_wing?
    glide until need_to_ground_down?
  end
end

class Bird
  include Fly

  # we get unneeded
  # def fuel_pump
  # def engin_start
end

## END of Bad

# Good one
#
module Fly
  @wings = ""
  def fly_up

  end
  def ground_down

  end
  def wing

  end
  def glide

  end
  def need_to_wing?

  end
  def can_glide?

  end
  def need_to_ground_down?

  end

  # update in your class
  def flying

  end
end

module MachineParts
  @engine = ""
  @fuel_level = 0

  def fuel_pump

  end
  def engin_start

  end

  def flying
    fuel_pump
    engin_start
    fly_up
    wing if need_to_wing?
    glide until need_to_ground_down?
  end
end

class Bird
  include Fly
end

class Plane
  include Fly
  include MachineParts
end

# End Good one