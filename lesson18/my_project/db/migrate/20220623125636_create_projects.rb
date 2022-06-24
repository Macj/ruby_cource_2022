class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :author
      t.string :description
      t.integer :developers_count
      t.string :platform

      t.timestamps
    end
  end
end
