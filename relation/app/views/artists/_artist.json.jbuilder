json.extract! artist, :id, :name, :age, :country, :lang, :created_at, :updated_at
json.url artist_url(artist, format: :json)
