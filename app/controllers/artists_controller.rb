class ArtistsController < ApplicationController
    def index
        @artists = Artist.all
    end
    
    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(a_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def edit 
        @artist = Artist.find(params[:id])
    end

    def update 
        @artist = Artist.find(params[:id])
        @artist.update(a_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def a_params(*args)
        params.require(:artist).permit(*args)
    end
end
