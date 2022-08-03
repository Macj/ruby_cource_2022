class CreateNewPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :new_posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
