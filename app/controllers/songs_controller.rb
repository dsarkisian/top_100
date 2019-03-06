class SongsController < ApplicationController
  
  before_action :set_artist
  before_action :set_song, only: [:show, :destroy]
  
  def index
    @songs = @artist.songs
  end

  def show
  end

  def edit
  end

  def update
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

  def destroy
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

  private 
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_song
      @song = @artist.songs.find(params[:id])
    end

    def songs_params
      params.require(:song).permit(:title)
    end
end
