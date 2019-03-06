class ArtistsController < ApplicationController
  

  # after_action :capitalize_name, only: [:new]
  before_action :set_artist, only:[:edit, :show, :destroy, :update]

  def index
    @artists = Artist.all
  end

  def show
  end

  def edit
    #  render partial: 'artists/form'
  end

  def update

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
    @artist.destroy
    redirect_to artists_path
  end


  private 

    def artist_params
     params.require(:artist).permit(:name)
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end
end
