class UserAlbumsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_action :set_user_album, only: [:destroy]

	def index
		@useralbums = User.find(current_user.id).albums
		@albums = Album.all
		respond_to do |format|
			format.html 
			format.json { render json: @useralbums }
		end
	end

	def new
		@albums = Album.all
	end

	def create
		@useralbum = UserAlbum.create(user_album_params)
		respond_to do |format|
	    	if @useralbum.save
	        	format.html { redirect_to user_user_albums_path }
	        	format.json { render :show, status: :created, location: @useralbum }
      		else
	        	format.html { redirect_to user_user_albums_path, notice: 'You already have this album' }
	        	format.json { render json: @useralbum.errors, status: :unprocessable_entity }
      		end
    	end
	end

	def destroy
	    @useralbum.destroy
	    respond_to do |format|
	      format.html { redirect_to user_user_albums_path, notice: 'User Album was deleted.' }
	      format.json { head :no_content }
	    end
  	end

	# def data
	# 	@useralbums = User.find(current_user.id).albums
	# end

	private

	def set_user_album
		@useralbum = current_user.albums.find(params[:id])
	end

	def user_album_params
		params.require(:user_album).permit(:album_id, :user_id)
	end
end
