class AddSexToArtist < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :sex, :string
  end
end
