class ArtworksController < ApplicationController

  def index
      render json: Artwork.all
  end 

  def create
      # debugger
      artwork = Artwork.new(artwork_params)
      if artwork.save!
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
  end

  def show
      render json: Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    debugger
    if @artwork.update(artwork_params)
        redirect_to artwork_url(@artwork)
    else
        render json: @artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    Artwork.find(params[:id]).destroy
    redirect_to artwork_url
  end

  def artwork_params
      params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
  
end