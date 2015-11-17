class Song < ActiveRecord::Base
	belongs_to :album
	# belongs_to :artist

	private
	def self.search(query) 
    	Song.search_by_name(query)
  	end
end
