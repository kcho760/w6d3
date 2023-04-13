class ArtworksController < ApplicationController

    def index
        # render plain: "I'm in the index action!" 
        # @Artworks = artwork.all
        render json: artwork.all
    end 

    def create
        # debugger
        artwork = artwork.new(params.require(:artwork).permit(:name, :email))
        if artwork.save!
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: artwork.find(params[:id])
    end
