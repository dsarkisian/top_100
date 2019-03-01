class SongsController < ApplicationController
  
  before_action :set_artist
  
  def index
    @songs = @artist.songs
  end

  def show
    @songs = Song.find(params[:id])
  end

  def edit
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(songs_params)

    if @song.save
      redirect_to artist_songs_path(@artist)
    else
      render :new
    end
  end

  private 
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def songs_params
      params.require(:song).permit(:title)
    end
end
