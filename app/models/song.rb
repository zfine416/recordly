class Song < ActiveRecord::Base
	belongs_to :album
	default_scope -> {order(album_id: :asc, track_number: :asc)}
	include PgSearch
  pg_search_scope :search_by_name, 
                  :against => [:song_name],
                  :using => {
                    :tsearch => {:prefix => true}
                  }


  	validates :track_number, numericality:{only_integer: true, greater_than: 0}

	private
	def self.search(query) 
    	Song.search_by_name(query)
  	end
end
