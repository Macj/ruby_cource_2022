class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :age
      t.string :country
      t.string :lang

      t.timestamps
    end
  end
end
