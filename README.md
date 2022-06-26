# ruby_cource_2022

# lesson19 specification
#  Создать приложение блог с двумя сущьностями
# Author - name, city, age
# has_many :posts
# Post - author, body, create_at   | belongs_to :author
# вывести под постом все его коментарии
# has_many :comments
# Comments - author, body | belongs_to :post, belongs_to :author (добавить селекты)