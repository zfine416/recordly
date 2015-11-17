class UserAlbum < ActiveRecord::Base
	belongs_to :user
	belongs_to :album
	validates :user_id, presence: true
	validates :album_id, presence: true
	validates :user_id, :uniqueness => {:scope => [:album_id]}
end
