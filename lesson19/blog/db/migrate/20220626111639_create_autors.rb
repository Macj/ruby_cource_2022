class CreateAutors < ActiveRecord::Migration[7.0]
  def change
    create_table :autors do |t|
      t.string :name
      t.string :city
      t.integer :age

      t.timestamps
    end
  end
end
