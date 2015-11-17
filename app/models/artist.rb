class Artist < ActiveRecord::Base
	has_many :albums
	has_many :songs, through: :albums

	private
	def self.search(query) 
    	Artist.search_by_name(query)
  	end
end
