class Song < ActiveRecord::Base
	belongs_to :album
	# belongs_to :artist
	default_scope -> {order(album_id: :asc, track_number: :asc)}

  	validates :track_number, numericality:{only_integer: true, greater_than: 0}

	private
	def self.search(query) 
    	Song.search_by_name(query)
  	end
end
