json.extract! song, :id, :title, :artist_id, :size, :cathegory, :created_at, :updated_at
json.url song_url(song, format: :json)
