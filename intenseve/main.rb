# Написать клас для хранения информации по постам
# (например в фейсбуке). В этом классе один пост
# должен иметь такие поля :author, :title, :text, :date
# :date - время и дата когда был создан (Использовать Time.now)
# В классе должны быть такие методы
#  - добавить пост в общий массив постов
#  - отсортировать посты от самого короткого до самог длинного
#  - отсортировать от самого свежего до самого позднего
#
# программа должна иметь меню с такими пунктами
# выводить один пост
# - первоя строка должна содержать :author, :title, :date
# - вторая содержать :text и черта после текста для разделения
# выводить все посты
# Выводить пасты отсортерованные по размеру
# выводить посты остортированные по дате
#params[ ] .count = 4
#

class PostList
  attr_accessor :posts

  def initialize(params_map)
    @post = {
      autor:    "",
      title: "",
      text:  "",
      date:  nil
    }
    create_posts_from(params_map)
  end
  #support
  def create_post(params)
    elem = @post.clone
    elem[:autor] = params[0]
    elem[:title] = params[1]
    elem[:text] = params[2]
    elem[:date] = params[3]
    elem
  end

  def make_posts_array(params_map)
    params_map.map do |params|
      create_post(params)
    end
  end
  #  interface
  def create_posts_from(params_map)
    @posts = make_posts_array(params_map)
  end

  def sort_by_size(param_map)
    @posts.sort_by {|elem| elem[:text].size}
  end

  def sort_by_date(params)
    sort_by(:date)
  end
  # сортировать используя переданный блок кода
  def sort_by(key)
    @posts.sort_by {|elem| elem[key]}
  end
end

class Decorators
# выводить один пост
    def one_post

    end
# выводить все посты
    def all_posts

    end
# выводить сорт по длине

  def sort_by_long(text)

    end
# выводить сорт по дате
  def sort_by_time(date)

    end
end

class Menu
  def show_menu
  puts clear
  puts "
  1.  выводить один пост \n
  2.  выводить все посты \n
  3.  выводить сорт по длине \n
  4.  выводить сорт по дате \n"
  gets.chomp.to_i
  end

  def hadle_choice(decorator, choice)
    case choice
    when 1
      decorator.show_results_for_one_post
    when 2
      decorator.show_results_for_all_posts
    when 3
      decorator.show_results_for_sort_by[:text]
    when 4
      decorator.show_results_for_sort_by[:date]
    else
      puts "enter your chosen number using keypad"
    end
  end

  def run

    post_odj =
    show_menu
    hendl_choice
  end

  choice = menu
end


min = 60
params_map = [
  ['autor1', 'title1', 'textkjhlkjhlkjhlkjh1', Time.now],
  ['autor2', 'title2', 'textkjhlkjhlkjh1', Time.now + 10 * min ],
  ['autor3', 'title3', 'textkjhljhgkjhgkkjhlkjhlkjh1', Time.now - 40 * min ],
  ['autor4', 'title4', 'jhlkjhlkjh1', Time.now - 100 * min]
]
