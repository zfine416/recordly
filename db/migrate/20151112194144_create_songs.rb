class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    	t.string :song_name
    	t.integer :track_number
    	t.references :album

      t.timestamps null: false
    end
  end
end
