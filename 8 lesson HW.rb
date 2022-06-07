# Дан целочисленный массив.
# Необходимо вывести вначале его элементы с нечетными индексами,
# а затем - четными.

# a = [1,2,3,4,5,6,7,8,9]
class ArrayDecorator
  def initialize(array=[])
    @array = array
    @even_line = ""
    @odd_line = ""
  end

  def show_by_indexes
    get_data if @array.empty?

    logic
    show_result
  end

  protected

  def get_data
    puts "Enter array split by coma"
    str = gets.chomp
    @array = str.split(',').map(&:to_i)
  end

  def line(i)
    i.to_s + " - " + @array[i].to_s + "\n"
  end

  def logic
    for i in  (0...@array.size)
      if i.even?
        @even_line += line(i)
      else
        @odd_line += line(i)
      end
    end
  end

  def show_result
    puts "Elements with odd indexes"
    puts @odd_line
    puts "Elements even indexes"
    puts @even_line
  end
end


decarator = ArrayDecorator.new([1,2,3,4,5,6,7,8,9])
decarator.show_by_indexes

decarator = ArrayDecorator.new
decarator.show_by_indexes



for var_name[, var_name2 ...] in expression [do]

for i in  (0...@array.size)
  arr[i]
end