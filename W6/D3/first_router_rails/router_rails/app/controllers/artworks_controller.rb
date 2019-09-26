class ArtworksController < ApplicationController

  def index
    artwork = Artwork.find_by(params[:artist_id])

    render json: artwork
  end

  def favorite_artwork
    #Parameters {"controller"=>"artworks", "action"=>"favorite_artwork", "id"=>"46"}
    render json: Artwork.find(params[:id]).favorite
  end

  def create
    artwork = Artwork.new(artwork_param)
    if artwork.save
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_param)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private

  def artwork_param
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end 
  
end

  

