class ArtistsController < ApplicationController
  
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
    #  render partial: 'artists/form'
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit
    end
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def new
    @artist = Artist.new
  end

  def destroy 
    Artist.find(params[:id]).destroy
    redirect_to artists_path
  end


  private 

    def artist_params
     params.require(:artist).permit(:name)
    end
end
