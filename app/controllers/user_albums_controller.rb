class UserAlbumsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_action :set_user_album, only: [:destroy]
	before_action :get_user_id
	
	# index routes will show all albums in users collection and allow users to add new albums
	def index
		@useralbums = current_user.albums
		@albums = Album.all
		# @useralbum = UserAlbum.where
	end

	def create
		@user_album = UserAlbum.new(user_album_params)
		@user_album.user_id = get_user_id

		respond_to do |format|
			if @user_album.save
				format.html {redirect_ to @user_albums, "Saved Succesfully"}
				format.js
				format.json { render json: @user_album }
			end
			# should handle failed save
		end
	end

	# currently destroy is destroying records from the album table.... rather than user_albums
	def destroy
		# binding.pry
		@useralbum.destroy_all
		redirect_to user_albums_path
  	end

	private

	def set_user_album
		@useralbum = UserAlbum.where(album_id:params[:id],user_id:current_user.id)
	end

	def user_album_params
		params.require(:user_album).permit(:album_id, :user_id)
	end

	def get_user_id
		current_user.id
	end
end
