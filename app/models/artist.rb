class Artist < ActiveRecord::Base
	has_many :albums
	has_many :songs, through: :albums
	include PgSearch
  pg_search_scope :search_by_name, 
                  :against => [:artist_name],
                  :using => {
                    :tsearch => {:prefix => true}
                  }

	private
	def self.search(query) 
    	Artist.search_by_name(query)
  	end
end
