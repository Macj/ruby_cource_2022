class FixPostReference < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :author_id
    add_column :posts, :autor_id, :integer, null: false, foreign_key: true
  end
end
