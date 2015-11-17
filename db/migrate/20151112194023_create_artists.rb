class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
    	t.string :artist_name
    	t.string :genre

      t.timestamps null: false
    end
  end
end
