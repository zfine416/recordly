class SearchController < ApplicationController

  def index
    if (params[:search])
      @artists = Artist.search(params[:search])
      @albums = Album.search(params[:search])
      @songs = Song.search(params[:search])
    end
  end

  def get_user_id
    current_user.id
  end
end