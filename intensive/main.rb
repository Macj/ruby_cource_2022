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

class PostsList # logic
  ## Interface
  # params type(arrya) size - 4
	def add_post(params)
	end

	def sort_by_text
	end

	def sort_by_date
	end

	private
	##  support
	def sort_by(key)
	end

end

class Decorator # show

	def initialize(post_list)
		@post_list = post_list
		@posts = @post_list.posts
	end

	# выводить один пост
	# - первоя строка должна содержать :author, :title, :date
	# - вторая содержать :text и черта после текста для разделения
	def show(post)
		author = post[:author];
		title = post[:title];
		date = post[:date].to_s
		puts "author: #{author}, title: #{title}, date: #{date}"
		puts post[:text]
		puts "____________________________________________"
	end

	def show_posts(posts)
		posts.each {|post|
			show(post)
		}
	end

	def posts_view
		show_posts(@posts)
	end
end

class Menu
end


posts_list = PostsList.new
decor = Decorator.new(posts_list)
decor.posts_view