json.extract! book, :id, :title, :body, :author_id, :page_count, :created_at, :updated_at
json.url book_url(book, format: :json)
