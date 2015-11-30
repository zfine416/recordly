class Album < ActiveRecord::Base
	include PgSearch
	 pg_search_scope :search_by_name, 
                  :against => [:album_name],
                  :using => {
                    :tsearch => {:prefix => true}
                  }
	has_many :user_albums
  	has_many :users, through: :user_albums
	belongs_to :artist
	has_many :songs


	private
	def self.search(query) 
    	Album.search_by_name(query)
  	end
end
