class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.references :artist, null: false, foreign_key: true
      t.integer :size
      t.string :cathegory

      t.timestamps
    end
  end
end
